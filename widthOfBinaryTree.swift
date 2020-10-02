import Foundation

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
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var queue = Array<(TreeNode?, Int, Int)>()
        queue.append((root, 0, 0))
        var currentDepth = 0
        var left = 0
        var result = 0
        while !queue.isEmpty {
            let (anode, depth, position) = queue.removeFirst()
            guard let node = anode else { continue }
            
            let protectPosition = position > 4611686018427387904 ? 0 : position * 2
            if(node.left != nil ) {
                queue.append((node.left, depth + 1, protectPosition))
            }
            if(node.right != nil ) {
                queue.append((node.right, depth + 1, protectPosition + 1))
            }
            
            if currentDepth != depth {
                currentDepth = depth
                left = position
            }
            result = max(position - left + 1, result)
        }
        return result
    }
}


//var root = TreeNode(1)
//root.left = TreeNode(2)
//root.right = TreeNode(3)
//root.left?.left = TreeNode(5)
//root.right?.right = TreeNode(6)
//root.left?.left?.left = TreeNode(7)
//root.right?.right?.right = TreeNode(9)
var root = TreeNode(0)
var p = root
for _ in 0...1000 {
    p.right = TreeNode(0)
    p = p.right ?? TreeNode(0)
}
print(Solution().widthOfBinaryTree(root))
