 public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
 }
 
 class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        //first step:locate the node and refer to its parent
        var node: TreeNode? = root
        var parent: TreeNode? = root
        while true {
            if node != nil {
                if node?.val==key {
                    break
                }
                else {
                    parent=node
                    node=(node!.val<key ? node?.right : node?.left)
                }
            }
            else {
                return root
            }
        }
        //second step : delete the node
        if node!.val == root!.val {
            return orderChildTree(node!)
        }
        else {
            if key<parent!.val {
                parent?.left=orderChildTree(node!)
            }
            else {
                parent?.right=orderChildTree(node!)
            }
        }
        return root
    }
    func orderChildTree(_ node:TreeNode) -> TreeNode {
        if node.left==nil || node.right==nil {
            return node.left==nil ? node.right! : node.left!
        }
        else if node.left?.right==nil {
            node.left?.right=node.right
            return node.left!
        }
        else {
            var minNode=node.right
            while minNode?.left != nil {
                minNode=minNode?.left
            }
            minNode?.left=node.left
            return node.right!
        }
    }
 }
 
 let root=TreeNode(5)
 root.left=TreeNode(3)
 root.right=TreeNode(6)
 root.left?.left=TreeNode(2)
 root.left?.right=TreeNode(4)
 root.right?.right=TreeNode(7)
 let sol=Solution()
 let rootx=sol.deleteNode(root,3)
 print(rootx?.left?.val as Any)
 print(rootx?.left?.left?.val as Any)
 print(rootx?.left?.right?.val as Any)
