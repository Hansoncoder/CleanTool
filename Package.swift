import PackageDescription

let package = Package(
    name: "CleanTool",
   dependencies:[
        .Package(url:"https://github.com/jatoben/CommandLine","3.0.0-pre1"),
        .Package(url:"https://github.com/onevcat/Rainbow","2.0.1")
    ]
)
