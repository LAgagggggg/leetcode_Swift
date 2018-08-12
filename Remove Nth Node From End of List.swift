
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var p:ListNode?=head
        for _ in 0...n {
            p=p?.next
        }
        var deleteP:ListNode?=head
        while p != nil {
            p=p?.next
            deleteP=deleteP?.next
        }
        deleteP?.next=deleteP?.next?.next
        return head
    }
}

let s = Solution()
let h=ListNode(1)
let next1=ListNode(2)
let next2=ListNode(3)
let next3=ListNode(4)
let next4=ListNode(5)
h.next=next1
next1.next=next2
next2.next=next3
next3.next=next4
print(h.next?.next?.next?.val)
s.removeNthFromEnd(h, 2)
print(h.next?.next?.next?.val)
