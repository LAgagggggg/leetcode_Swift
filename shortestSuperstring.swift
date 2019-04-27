//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {

    func shortestSuperstring(_ A: [String]) -> String {

        let N=A.count

        var overlaps=Array<[Int]>(repeating: Array(repeating: 0, count: N), count: N)

        //calculating each word pairs' overlap
        for i in 0..<N {
            for j in 0..<N {
                let m=min(A[i].count, A[j].count)
                for k in stride(from: m, through: 0, by: -1){
                    if A[i].hasSuffix(A[j][A[j].startIndex..<A[j].index(A[j].startIndex, offsetBy: k)]){
                        overlaps[i][j]=k
                        break
                    }
                }
            }
        }

        var dp=Array<[Int]>(repeating: Array(repeating: 0, count: N), count: 1<<N)
        var parent=Array<[Int]>(repeating: [], count: 1<<N)
        for mask in 0..<(1<<N) { //for each combination
            parent[mask]=Array(repeating: -1, count: N)

            for bit in 0..<N {
                if ((mask>>bit)&1) > 0 { // for each string in this combination
                    let pmask = mask ^ (1<<bit)
                    if pmask==0 {continue} //only one word?

                    for i in 0..<N{
                        if ((pmask>>i)&1)>0{
                            let val=dp[pmask][i]+overlaps[i][bit]
                            if val>dp[mask][bit]{
                                dp[mask][bit]=val
                                parent[mask][bit]=i
                            }
                        }
                    }
                }
            }
        }

        var indexArray=Array<Int>()
        var currMask=(1<<N)-1
        var index=indexOfMaxInArray(dp[currMask])
        indexArray.append(index)
        while true{
            let oldIndex=index
            index=parent[currMask][oldIndex]
            currMask-=(1<<oldIndex)
            if currMask<=0 || index == -1 {break} //index==-1 means no matter where we put the remaining word
            indexArray.append(index)
        }

        indexArray.reverse()
        var result=String()
        var addedFlag=Array<Bool>(repeating: false, count: N)
        result.append(A[indexArray[0]])
        addedFlag[indexArray[0]]=true
        for i in 1..<indexArray.count {
            let index = indexArray[i]
            let str=A[index]
            addedFlag[index]=true
            result.append(String(str[str.index(str.startIndex, offsetBy: overlaps[indexArray[i-1]][index]) ..< str.endIndex]))
        }
        for i in 0..<addedFlag.count {
            if (!addedFlag[i]){
                result.append(A[i])
            }

        }

        return result
    }

    private func indexOfMaxInArray(_ array:[Int]) -> Int {
        var max=array[0]
        var index=0
        for i in 1..<array.count {
            if array[i]>max{
                max=array[i]
                index=i
            }
        }
        return index
    }
}

print(Solution().shortestSuperstring(["catg","ctaagt","gcta","ttca","atgcatc"]))
print(Solution().shortestSuperstring(["alex","loves","leetcode"]))