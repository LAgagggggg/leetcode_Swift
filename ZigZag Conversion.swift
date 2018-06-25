import Foundation
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        let letterPerCycle=(2*numRows-2)
        if letterPerCycle<=0 || s.count<=numRows {
            return s
        }
        let colCnt=s.count/letterPerCycle
        let letterInMid=letterPerCycle - numRows
        let remainedCnt=(colCnt+1)*letterPerCycle-s.count
        var c:Character
        var resultS:[Character]=[]
        var Sarr=Array(s.characters)
        for _ in 0..<remainedCnt{
            Sarr+="*"
        }
        var i=0
        while i<Sarr.count{
            c=Sarr[i]
            c=="*" ?nil:resultS.append(c)
            i+=letterPerCycle
        }
        if letterInMid>=1 {
            for j in 1...letterInMid{
                i=j
                while i<Sarr.count{
                    c=Sarr[i]
                    c=="*" ?nil:resultS.append(c)
                    c=Sarr[i+letterPerCycle-2*j]
                    c=="*" ?nil:resultS.append(c)
                    i+=letterPerCycle
                }
            }
        }
        i=numRows-1
        while i<Sarr.count{
            c=Sarr[i]
            c=="*" ?nil:resultS.append(c)
            i+=letterPerCycle
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("part2：%f 毫秒", (endTime - startTime)*1000)
        return String(resultS)
    }
}
let sol = Solution()
print(sol.convert("PAYPAPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGLISHIRING", 3))

