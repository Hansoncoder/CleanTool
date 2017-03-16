import PackageDescription

let package = Package(
    name: "CleanTool",
    targets: [
        Target(name: "CleanToolKit", dependencies: []),
        Target(name: "CleanTool", dependencies: ["CleanToolKit"])
    ],
   dependencies:[
        .Package(url:"https://github.com/jatoben/CommandLine","3.0.0-pre1"),
        .Package(url:"https://github.com/onevcat/Rainbow","2.0.1"),
        .Package(url:"https://github.com/kylef/PathKit","0.8.0")
    ]
)
