//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {

    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var result = 0
        var begin = 0
        var length = 0
        var sum = 0
        for _ in 0..<nums.count {
            sum += nums[length]
            length += 1
            if sum >= s {
                break
            }
        }
        if sum < s {
            return 0
        }
        result = length
        while true {

            while sum - nums[begin] >= s {
                sum -= nums[begin]
                begin += 1
                length -= 1
            }
            if length < result {
                result = length
            }

            if begin + length >= nums.count {
                break
            }
            sum += nums[begin + length]
            length += 1

        }
        return result
    }
}

print(Solution().minSubArrayLen(11, [1,2,3,4,5]))