class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count==0 {
            return []
        }
        var start = 0
        var maxIndex=0
        var result = [Int]()
        for i in 1..<k {
            if nums[i] > nums[maxIndex] {
                maxIndex=i
            }
        }
        result.append(nums[maxIndex])
        while start+k < nums.count {
            if start != maxIndex && nums[start+k] < nums[maxIndex] {
            }
            else{
                maxIndex=start+1
                for i in 2..<k+1 {
                    if nums[start+i] > nums[maxIndex] {
                        maxIndex=start+i
                    }
                }
            }
            start+=1
            result.append(nums[maxIndex])
        }
        return result
    }
}

print(Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
