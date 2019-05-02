//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    func uniqueLetterString(_ S: String) -> Int {
        if S.count==0 {return 0}
        let str = Array<Character>(S)
        var dp = Array(repeating:Array(repeating: (count:0,dict:Dictionary<Character,Int>()), count: str.count + 1), count: S.count)
        var result=str.count
        for i in 0..<str.count {
            dp[i][1].count=1
            dp[i][1].dict[str[i]]=1
            var j=2
            while j<=str.count-i{
                dp[i][j].dict = dp[i][j - 1].dict
                switch dp[i][j].dict[str[i+j-1]] {
                case nil:
                    dp[i][j].count = dp[i][j - 1].count + 1
                    dp[i][j].dict[str[i+j-1]]=1
                case 1:
                    dp[i][j].count = dp[i][j - 1].count - 1
                    dp[i][j].dict[str[i+j-1]]=2
                default:
                    dp[i][j].count = dp[i][j - 1].count
                }
                result+=dp[i][j].count
                j+=1
            }
        }
        return result
    }
}

print(Solution().uniqueLetterString("ABC"))

