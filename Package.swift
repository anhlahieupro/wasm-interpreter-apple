// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "WasmInterpreter",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "WasmInterpreter",
            targets: ["WasmInterpreter"]
        ),
    ],
    dependencies: [
//        .package(
//            url: "https://github.com/shareup/synchronized.git",
//            from: "4.0.0"
//        ),
        .package(
            url: "https://github.com/anhlahieupro/cwasm3.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "WasmInterpreter",
            dependencies: [
                .product(name: "CWasm3", package: "cwasm3"),
//                "CWasm3",
//                .product(name: "Synchronized", package: "synchronized"),
            ],
            cSettings: [
                .define("APPLICATION_EXTENSION_API_ONLY", to: "YES"),
            ]
        ),
//        .binaryTarget(
//            name: "CWasm3",
//            path: "./Sources/WasmInterpreter/CWasm3.xcframework"
//        ),
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
