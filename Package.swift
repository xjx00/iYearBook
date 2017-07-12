import PackageDescription

//let package = Package(
//    name: "Hello",
//    dependencies: [
//       .Package(url: "https://git.coding.net/xjx00/vapor.git",majorVersion: 1, minor: 1)
//    ]
//)
let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2, minor: 0),
        .Package(url: "https://github.com/BrettRToomey/brett-xml.git", majorVersion: 1),
        .Package(url: "https://github.com/sfaxon/vapor-memory-provider.git", majorVersion: 1)
    
    ],
    exclude: [
        "Config",
    ]
)
