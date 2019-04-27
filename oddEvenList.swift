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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {return head}
        let evenHead=head?.next
        var prevP1=head
        var prevP2=head?.next
        var p=prevP2?.next
        while (p != nil){
            prevP1?.next=p
            prevP2?.next=p?.next
            if (prevP2?.next == nil) {
                prevP1=prevP1?.next
                break
            }
            prevP1=prevP1?.next
            prevP2=prevP2?.next
            p=prevP2?.next
        }
        prevP1?.next=evenHead
        return head
    }
}

var head=ListNode(1)
head.next=ListNode(2)
head.next?.next=ListNode(3)
head.next?.next?.next=ListNode(4)
head.next?.next?.next?.next=ListNode(5)
head.next?.next?.next?.next?.next=ListNode(6)
let newHead=Solution().oddEvenList(head)
print(newHead?.val, newHead?.next?.val)