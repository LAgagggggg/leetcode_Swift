
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var stack = [TreeNode]()
        var dict=[Int:Int]()
        stack.append(root!)
        dict[root!.val]?=0
        while !stack.isEmpty {
            let t=stack.popLast()
            if (t!.left?.val,t!.right?.val)==(x,y) || (t!.left?.val,t!.right?.val)==(y,x) {
                return false
            }
//            print("node.val:\(t?.val) .depth:\(dict[t!.val]?.Depth) .parent:\(dict[t!.val]?.Parent)")
            let depth=dict[t!.val] ?? 0
            if t?.left != nil {
                dict.updateValue(depth+1, forKey: t!.left!.val)
                stack.append(t!.left!)
            }
            if t?.right != nil {
                dict.updateValue(depth+1, forKey: t!.right!.val)
                stack.append(t!.right!)
            }
        }
        return dict[x]==dict[y]
    }
}

var root = TreeNode(1)
root.left=TreeNode(2)
root.right=TreeNode(3)
root.left?.right=TreeNode(4)
root.right?.right=TreeNode(5)

print(Solution().isCousins(root, 4, 5))
