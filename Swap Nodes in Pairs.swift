
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var p:ListNode? = head?.next?.next
        let newHead=head?.next
        newHead?.next=head
        newHead?.next?.next=p
        var lastP:ListNode? = newHead?.next
        while p != nil && p?.next != nil {
            lastP?.next=p?.next
            p?.next=lastP?.next?.next
            lastP?.next?.next=p
            p=p?.next
            lastP=lastP?.next?.next
        }
        return newHead
    }
}

let list1=ListNode(1)
list1.next=ListNode(2)
list1.next?.next=ListNode(3)
list1.next?.next?.next=ListNode(4)
let result=Solution.init().swapPairs(list1)
print(result?.next?.next?.next?.val)
