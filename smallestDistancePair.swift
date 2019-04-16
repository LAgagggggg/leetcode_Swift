//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let sorted=nums.sorted()
        let maxNum = sorted.last!
        var duplicatedNumCount=Array(repeating: 0, count: nums.count)
        var notBiggerNumCount=Array(repeating: 0, count: maxNum+1)
        var sortedIndex=0
        for i in 1..<sorted.count{
            if sorted[i]==sorted[i-1]{
                duplicatedNumCount[i]=duplicatedNumCount[i-1]+1
            }
            else{
                duplicatedNumCount[i]=duplicatedNumCount[i-1]
            }
        }
        for i in 0...maxNum {
            while sortedIndex<sorted.count && sorted[sortedIndex]==i {sortedIndex+=1}
            notBiggerNumCount[i]=sortedIndex
        }
        //start binary search
        var low=0, high=maxNum
        while low<high {
            let mid=(low+high)/2
            var count = 0
            for i in 0..<sorted.count{
                count+=notBiggerNumCount[min(sorted[i]+mid,maxNum)]-notBiggerNumCount[sorted[i] ]+duplicatedNumCount[i]
            }
            if count>=k {high=mid}
            else {low=mid+1}
        }
        return low
    }
}

print(Solution().smallestDistancePair([62,100,4],2))


