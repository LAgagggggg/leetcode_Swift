class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let sortedNums=nums.sorted()
        let avg:Int=sortedNums[nums.count/2]
        var moveCnt=0
        for num in nums{
        	moveCnt+=abs(num-avg)
        }
        return moveCnt
    }
}
print(Solution().minMoves2([1,0,0,8,6]))