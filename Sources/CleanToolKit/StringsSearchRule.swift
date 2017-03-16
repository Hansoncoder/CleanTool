//
//  StringsSearchRule.swift
//  CleanTool
//
//  Created by Hanson on 2017/3/16.
//
//

import Foundation

protocol StringsSearcher {
    func search(in content: String) -> Set<String>
}

protocol RegexStringsSearcher: StringsSearcher {
    var patterns: [String] { get }
    
}

extension RegexStringsSearcher {
    func search(in content: String) -> Set<String> {
        
        var result = Set<String>()
        
        for pattern in patterns {
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
                print("创建正则表达式: \(pattern)错误")
                continue
            }
            
            let matches = regex.matches(in: content, options: [], range: content.fullRange)
            
            for checkingResult in matches {
                let range = checkingResult.rangeAt(1)
                let extracted = NSString(string: content).substring(with: range)
                result.insert(extracted.plainName)
            }
        }
        
        return result
    }
}
