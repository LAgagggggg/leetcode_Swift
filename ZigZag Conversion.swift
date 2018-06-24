class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let letterPerCycle=(2*numRows-2)
        if letterPerCycle<=0 || s.count<=numRows {
            return s
        }
        let colCnt=s.count/letterPerCycle
        let letterInMid=letterPerCycle - numRows
        let remainedCnt=(colCnt+1)*letterPerCycle-s.count
        var resultS=""
        var modifiedS=s
        for _ in 0..<remainedCnt{
            modifiedS+="*"
        }
        var i=0
        while i<modifiedS.count{
            resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i)])
            i+=letterPerCycle
        }
        if letterInMid>=1 {
            for j in 1...letterInMid{
                i=j
                while i<modifiedS.count{
                    resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i)])
                    resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i+letterPerCycle-2*j)])
                    i+=letterPerCycle
                }
            }
        }
        i=numRows-1
        while i<modifiedS.count{
            resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i)])
            i+=letterPerCycle
        }
        while let index=resultS.index(of: "*") {
            resultS.remove(at: index)
        }
        return resultS
    }
}
let sol = Solution()
print(sol.convert("PAYPALISHIRING", 3))

