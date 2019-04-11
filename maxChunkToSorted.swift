class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        let sortedArr=arr.sorted()
        var match=Dictionary<Int,Int>()
        var matchCount=0;
        var count=0;
        for i in 0..<arr.count {
            match[sortedArr[i]]=(match[sortedArr[i]] ?? 0)+1;
            if match[sortedArr[i]] == 0 {matchCount-=1}
            if match[sortedArr[i]] == 1 {matchCount+=1}
            
            match[arr[i]]=(match[arr[i]] ?? 0)-1;
            if match[arr[i]] == 0 {matchCount-=1}
            if match[arr[i]] == -1 {matchCount+=1}
            
            count += matchCount == 0 ? 1:0;
        }
        return count
    }
}