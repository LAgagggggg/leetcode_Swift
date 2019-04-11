//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var j=0,i=0
        var stack=Array<Int>()
        while i<popped.count {
            if stack.last == popped[i] {
                stack.removeLast()
                i+=1
                continue
            }
            repeat {
                if j>=pushed.count {
                    return false
                }
                stack.append(pushed[j])
                j+=1;
            }while pushed[j-1] != popped[i];
        }
        return true
    }
}

let array1=[1,2,3,4,5]
let array2=[4,5,3,2,1]
print(Solution().validateStackSequences(array1, array2))
