// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "WasmInterpreter",
    platforms: [
        .macOS(.v11), .iOS(.v14),
    ],
    products: [
        .library(
            name: "WasmInterpreter",
            targets: ["WasmInterpreter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/anhlahieupro/synchronized.git",
            branch: "test"
        ),
        .package(url: "https://github.com/shareup/cwasm3.git",
                 .upToNextMinor(from: "0.5.0"))
    ],
    targets: [
        .target(
            name: "WasmInterpreter",
            dependencies: [
                .product(name: "Synchronized", package: "synchronized"),
                .product(name: "CWasm3", package: "cwasm3"),
            ],
            cSettings: [
                .define("APPLICATION_EXTENSION_API_ONLY", to: "YES"),
            ]
        ),
        .testTarget(
            name: "WasmInterpreterTests",
            dependencies: ["WasmInterpreter"],
            exclude: [
                "Resources/constant.wat",
                "Resources/memory.wat",
                "Resources/fib64.wat",
                "Resources/imported-add.wat",
                "Resources/add.wat",
            ]
        ),
    ]
)
