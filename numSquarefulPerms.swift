//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

//===============My Solution=================
class Solution {
    func numSquarefulPerms(_ A: [Int]) -> Int {
        let sortedA=A.sorted()
        let N=A.count
        var dp=Array<[Int]>(repeating: Array(repeating: 0, count: N), count: 1<<N)
        for i in 0..<N{
            dp[1<<i][i]=1
        }
        for i in 1 ..< 1<<N {
            for j in 0..<N{
                if (i>>j)&1 == 0 || i == 1<<j{
                    continue
                }
                else {
                    let notThisMask=i-(1<<j)
                    var count=0
                    var prevNum = -1
                    for k in 0..<N{
                        if (notThisMask>>k)&1 == 0 || sortedA[k] == prevNum{
                            continue
                        }
                        prevNum=sortedA[k]
                        count+=(isSquareful(sortedA[k]+sortedA[j]) ? dp[notThisMask][k]:0)
                    }
                    dp[i][j]=count
                }
            }
        }
        var count=0
        var prevNum = -1
        for i in 0..<N {
            if sortedA[i] != prevNum{
                prevNum=sortedA[i]
                count+=dp[1 << N - 1][i]
            }
        }
        return count
    }

    private func isSquareful(_ number : Int) -> Bool {
        let sqrtNum=Int(sqrt(Double(number)))
        return sqrtNum*sqrtNum == number
    }
}

//===============Better Solution=================
class BetterSolution {
    func numSquarefulPerms(_ A: [Int]) -> Int {
        var count = 0
        func findPermutation(_ perm: [Int], _ newNums: [Int]) {
            print("\(perm),\(newNums)")
            if perm.count == A.count {
                count += 1
                return
            }
            var usedNum = [Int:Bool]()
            for i in 0..<newNums.count {
                var perm = perm
                if usedNum[newNums[i]] == nil {
                    if let last = perm.last {
                        if !isPerfectSquare(last + newNums[i]) {
                            continue
                        }
                    }
                    perm.append(newNums[i])
                    var newNums = newNums
                    usedNum[(newNums[i])] = true
                    newNums.remove(at: i)
                    findPermutation(perm, newNums)
                }
            }
        }

        findPermutation([], A)
        return count
    }


    func isPerfectSquare(_ num: Int) -> Bool {
        let sqrtNum=Int(sqrt(Double(num)))
        return sqrtNum*sqrtNum == num
    }
}

//print(BetterSolution().numSquarefulPerms([1,17,8]))
print(BetterSolution().numSquarefulPerms([17,1,8,3,8,1,3,24,8,8,8,8,8,8,8,8,8]))


