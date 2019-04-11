class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict:[Int:Int]=Dictionary()
        for num in nums {
            dict[num]=(dict[num] ?? 0)+1
        }
        for key in dict.keys {
            if dict[key] != 3 {
                return key
            }
        }
        return 0
    }
}

Solution().singleNumber([0,1,0,1,0,1,99])