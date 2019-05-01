//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        if head == nil {return []}
        var result=[Int]()
        var stack=[(index:Int,value:Int)]()
        var p=head
        var i = 0
        while p != nil{
            while (!stack.isEmpty && p!.val>stack.last!.value){
                let item = stack.popLast()!
                result[item.index]=p!.val
            }
            stack.append((i,p!.val))
            result.append(0)
            p=p?.next
            i+=1
        }
        return result
    }
}

//class Solution {
//    func nextLargerNodes(_ head: ListNode?) -> [Int] {
//        if head == nil {return []}
//        var result=[Int]()
//        var p=head
//        while p != nil{
//            result.append(p!.val)
//            p=p?.next
//        }
//        var modified:[Bool]=Array(repeating: false, count: result.count)
//        var lastNotModified=0
//        for i in 1..<result.count {
//            for j in lastNotModified..<i{
//                if !modified[j] && result[i]>result[j]{
//                    result[j]=result[i]
//                    modified[j]=true
//                    if j==lastNotModified {lastNotModified+=1}
//                }
//            }
//        }
//        for i in lastNotModified..<modified.count{
//            if !modified[i]{
//                result[i]=0
//            }
//        }
//        return result
//    }
//}


var head=ListNode(2)
head.next=ListNode(7)
head.next?.next=ListNode(4)
head.next?.next?.next=ListNode(3)
head.next?.next?.next?.next=ListNode(5)
print(Solution().nextLargerNodes(head))

