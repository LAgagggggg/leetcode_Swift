//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        let N = A.count
        var count = Array<(A: Int, B: Int, DUP: Int)>(repeating: (A: 0, B: 0, DUP: 0), count: 7)
        for i in 0..<N {
            if A[i] == B[i] {
                count[A[i]].DUP += 1
            }
            count[B[i]].B += 1
            count[A[i]].A += 1
        }
        var minSwap = N + 1
        for i in 1...6 {
            if count[i].A + count[i].B - count[i].DUP >= N {
                let minValue=min(count[i].A, count[i].B) - count[i].DUP
                if minSwap > minValue  {
                    minSwap = minValue
                }
            }
        }
        if minSwap == N + 1 {
            return -1
        }
        return minSwap
    }
}

print(Solution().minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2]))
print(Solution().minDominoRotations([1, 2, 1, 1, 1, 2, 2, 2], [2, 1, 2, 2, 2, 2, 2, 2]))
print(Solution().minDominoRotations([3, 5, 1, 2, 3], [3, 6, 3, 3, 4]))