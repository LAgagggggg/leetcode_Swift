class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let letterPerCycle=(2*numRows-2)
        if letterPerCycle<=0 || s.count<=numRows {
            return s
        }
        let colCnt=s.count/letterPerCycle
        let letterInMid=letterPerCycle - numRows
        let remainedCnt=(colCnt+1)*letterPerCycle-s.count
        var resultS:[Character]=[]
        var Sarr=Array(s.characters)
        for _ in 0..<remainedCnt{
            Sarr+="*"
        }
        var i=0
        while i<Sarr.count{
            resultS.append(Sarr[i])
            i+=letterPerCycle
        }
        if letterInMid>=1 {
            for j in 1...letterInMid{
                i=j
                while i<Sarr.count{
                    resultS.append(Sarr[i])
                    resultS.append(Sarr[i+letterPerCycle-2*j])
                    i+=letterPerCycle
                }
            }
        }
        i=numRows-1
        while i<Sarr.count{
            resultS.append(Sarr[i])
            i+=letterPerCycle
        }
        while let index=resultS.index(of: "*") {
            resultS.remove(at: index)
        }
        return String(resultS)
    }
}
let sol = Solution()
print(sol.convert("PAYPALISHIRING", 3))

