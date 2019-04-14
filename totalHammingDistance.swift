//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        if (nums.count < 2) {
            return 0
        }
        var bitsOnCount = Array.init(repeating: 0, count: Int.bitWidth)
        for num in nums {
            var currentBit = 0
            var temp=num
            while true{
                let trailingBit = temp.trailingZeroBitCount
                currentBit+=trailingBit+1
                if currentBit>=Int.bitWidth {break}
                bitsOnCount[currentBit-1]+=1
                temp=temp>>(trailingBit+1)
            }
        }
        return bitsOnCount.reduce(0) { result, element in
            return result + (element * (nums.count - element))
        }
    }
}

print(Solution().totalHammingDistance([4,4,14]))

