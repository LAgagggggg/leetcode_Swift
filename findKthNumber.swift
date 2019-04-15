//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    
    /*  Multiplication Table
      1  2  3  4  5  6
      2  4  6  8 10 12
      3  6  9 12 15 18
      4  8 12 16 20 24
    */
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var low = 1
        var high = m*n
        while low<high {
            let mid = (low+high)/2
            if beyondKth(mid, m, n, k) {high=mid}
            else {low=mid+1}
        }
        return low
    }
    
    private func beyondKth(_ num: Int, _ m: Int, _ n: Int, _ k: Int) -> Bool {
        var count = 0
        for i in 1...m {
            count+=min(num/i, n)
        }
        return count>=k
    }
}

print(Solution().findKthNumber(3, 3, 5))

