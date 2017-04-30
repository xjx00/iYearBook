import PackageDescription

let package = Package(
    name: "Hello",
    dependencies: [
        .Package(url: "https://git.coding.net/xjx00/vapor.git",majorVersion: 1, minor: 1)
    ]
)
