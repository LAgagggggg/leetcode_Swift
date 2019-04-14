//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var selectedWords=[String]()
        var characterCount=0;
        var result = [String]()
        var i=0
        while i != words.count {
            let word = words[i]
            if characterCount+word.count+selectedWords.count <= maxWidth{
                selectedWords.append(word)
                characterCount+=word.count
            }
            else{
                //time to create a new line !
                result.append(formLine(selectedWords, characterCount, maxWidth, false))
                characterCount=0
                selectedWords.removeAll()
                selectedWords.append(word)
                characterCount+=word.count
            }
            i+=1
        }
        if !selectedWords.isEmpty {
            result.append(formLine(selectedWords, characterCount, maxWidth, true))
        }
        return result
    }
    func formLine(_ words: [String],_ characterCount:Int , _ maxWidth: Int, _ isLastLine: Bool) -> String {
        if words.count==1 {//handle only one word situation
            return words.first!+String(repeating: " ", count: maxWidth-characterCount)
        }
        let spaceNeed = (maxWidth-characterCount)/(words.count-1)
        var extraSpace = (maxWidth-characterCount)%(words.count-1)
        var result=String()
        for word in words {
            result+=word
            if !isLastLine{
                result+=String(repeating: " ", count: spaceNeed+(extraSpace > 0 ? 1:0))
                extraSpace-=1
            }
            else {
                result+=" "
            }
        }
        if isLastLine && result.count<maxWidth {
            result+=String(repeating: " ", count: maxWidth-result.count)
        }
        let aResult = String(result.prefix(maxWidth))
        return aResult
    }
}

print(Solution().fullJustify(["ask","not","what","your","country","can","do","for","you","ask","what","you","can","do","for","your","country"],
    16))
print("================================")
print(Solution().fullJustify(["Science","is","what","we","understand","well","enough","to","explain",
                              "to","a","computer.","Art","is","everything","else","we","do"],
    20))
print("================================")
print(Solution().fullJustify(["What","must","be","acknowledgment","shall","be"],
                             16))
print("================================")

