class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var sortByHeightArr:[(height:Int,index:Int)]=Array()
        var tempArr:[(Int,Int)]=Array()
        for i in 0..<height.count {
            tempArr.append((height[i],i))
        }
        sortByHeightArr=tempArr.sorted{$0.0 < $1.0}
        var border=(left:0,right:height.count-1)
        var largest=0
        var rightBorderUpdateFlag = false
        var leftBorderUpdateFlag = false
        for i in 0..<sortByHeightArr.count {
            var square=0
            let item = sortByHeightArr[i]
            let previous:Int = i != 0 ? sortByHeightArr[i-1].height:0
            let changeNowFlag:Bool = previous==item.height ? false:true
            if changeNowFlag{
                if leftBorderUpdateFlag{
                    var j = border.left
                    repeat{
                        j+=1
                    }while height[j] <= previous
                    border.left=j
                    leftBorderUpdateFlag=false
                }
                if rightBorderUpdateFlag{
                    var j = border.right
                    repeat{
                        j-=1
                    }while height[j] <= previous
                    border.right=j
                    rightBorderUpdateFlag=false
                }
            }
            if(item.index == border.left){
                square=item.height * (border.right - item.index)
                leftBorderUpdateFlag=true
            }
            else if(item.index == border.right){
                square=item.height * (item.index - border.left)
                rightBorderUpdateFlag=true
            }
            else{
                square=item.height * max(abs(item.index-border.left), abs(item.index-border.right))
            }
            if square>largest {largest=square}
        }
        return largest
    }
}

let s = Solution()
print(s.maxArea([5,2,6,4,6,8,9,3]))
//print(s.maxArea([2,1]))
