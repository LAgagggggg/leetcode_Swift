//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count==0 {
            return []
        }
        var copiedNums = nums
        return recursivePermute(&copiedNums, nums.count)
    }
    func recursivePermute(_ nums: inout [Int], _ length: Int) -> [[Int]] {
        if length == 1 {
            return [[nums.first!]]
        }
        var result = [[Int]]()
        for i in 0..<length {
            nums.swapAt(i, length-1)
            for last in recursivePermute(&nums, length-1){
                result.append(last+[nums[length-1]])
            }
            nums.swapAt(i, length-1)
        }
        return result
    }
}

print(Solution().permute([1,2,3]))

