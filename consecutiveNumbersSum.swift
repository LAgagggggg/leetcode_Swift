//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    
    func consecutiveNumbersSum(_ N: Int) -> Int {
        //sum=(N0+Nn)*n/2
        let sqrtN=Int(sqrt(Double(N)))
        var result=0
        for i in 1...sqrtN {
            if N%i == 0{
                let count=N/i
                if i%2==1{
                    result+=1
                }
                if count != i && count%2==1{
                    result+=1
                }
            }
        }
        return result
    }
}

print(Solution().consecutiveNumbersSum(5))
print(Solution().consecutiveNumbersSum(9))
print(Solution().consecutiveNumbersSum(100))