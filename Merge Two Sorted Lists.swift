
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {return l2}
        if l2 == nil {return l1}
        
        var p1:ListNode?=l1
        var p2:ListNode?=l2
        let head:ListNode? = p1!.val <= p2!.val ? p1 : p2
        if head===p1 {p1=p1?.next}
        else {p2=p2?.next}
        var p:ListNode? = head
        while p1 != nil && p2 != nil {
            if p1!.val <= p2!.val {
                p!.next=p1
                p1=p1?.next
            }
            else{
                p!.next=p2
                p2=p2?.next
            }
            p=p?.next
        }
        if p1 == nil {
            p?.next=p2
        }
        else{
            p?.next=p1
        }
        return head
    }
}
