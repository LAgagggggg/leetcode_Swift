
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var mutableLists = lists
        var i=0
        var nonNilCount=0
        while i<mutableLists.count {
            let list = mutableLists[i]
            if list==nil {
                mutableLists.remove(at: i)
                i-=1
            }
            else {nonNilCount+=1}
            i+=1
        }
        var head:ListNode?=nil
        var p:ListNode? = nil
        while nonNilCount>0 {//确定head
            let minIndex=minIndexOfLists(mutableLists)
            if head==nil{
                head=mutableLists[minIndex]
                p=head
            }
            else{
                p?.next=mutableLists[minIndex]
                p=p?.next
            }
            if mutableLists[minIndex]?.next != nil{
                mutableLists[minIndex]=mutableLists[minIndex]?.next
            }
            else{
                nonNilCount-=1
                mutableLists.remove(at: minIndex)
            }
        }
        return head
    }
    
    func minIndexOfLists(_ lists: [ListNode?]) -> Int{
        var min=Int.max
        var minIndex:Int=0
        for i in 0..<lists.count {
            if lists[i]!.val<min {
                min=lists[i]!.val
                minIndex=i
            }
        }
        return minIndex
    }
}

let list1=ListNode(1)
list1.next=ListNode(4)
list1.next?.next=ListNode(5)
let list2=ListNode(1)
list2.next=ListNode(3)
list2.next?.next=ListNode(4)
let list3=ListNode(2)
list3.next=ListNode(6)
let lists=[list1,list2,list3]
let result=Solution.init().mergeKLists(lists)
print(result?.next?.next?.val)
