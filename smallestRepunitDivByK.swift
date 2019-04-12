class Solution {
    func smallestRepunitDivByK(_ K: Int) -> Int {
        var set=Array(repeating: 0, count: K)
        var num=1
        var length = 1
        while true {
            if num%K==0 {
                return length
            }
            set[num]=1
            num=(10*num+1)%K
            length+=1
            if set[num]==1 {
                return -1
            }
        }
    }
}

print(Solution().smallestRepunitDivByK(4))
