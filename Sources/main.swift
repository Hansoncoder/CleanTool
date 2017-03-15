import Foundation
import CommandLineKit
import Rainbow

let cli = CommandLineKit.CommandLine()

let projectOption = StringOption(shortFlag: "p",
                                 longFlag: "project",
                                 helpMessage: "需搜索项目的路径")

let resourceExtensionOption = MultiStringOption(shortFlag: "r",
                                                longFlag: "resource-extension",
                                                helpMessage: "需要搜索图片的扩展名")

let excludePathsOption = MultiStringOption(shortFlag: "e",
                                           longFlag: "exclude",
                                           helpMessage: "不需要清理的文件夹")

let fileExtensionsOption = MultiStringOption(shortFlag: "f",
                                             longFlag: "file-extension",
                                             helpMessage: "需要搜索文件的扩展名")
let help = BoolOption(shortFlag: "h",
                      longFlag: "help",
                      helpMessage: "查看帮助信息")

cli.addOptions(projectOption, resourceExtensionOption, fileExtensionsOption, help)



// mark - Rainbow

cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.blue
    default:
        str = s
    }
    
    return cli.defaultFormat(s: str, type: type)
}

// mark - extu
do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}


if help.value {
    cli.printUsage()
    exit(EX_OK)
}


let project = projectOption.value ?? "."
let resourceExtensions = resourceExtensionOption.value ?? ["png","jpg","imageset"]
let fileExtensions = fileExtensionsOption.value ?? ["m","mm","swift","xib","storyboard"]
let excludePaths = excludePathsOption.value ?? []








