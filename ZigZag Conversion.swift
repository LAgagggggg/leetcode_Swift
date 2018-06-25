//import Foundation
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
//        let startTime = CFAbsoluteTimeGetCurrent()
        let letterPerCycle=(2*numRows-2)
        if letterPerCycle<=0 || s.count<=numRows {
            return s
        }
        let letterInMid=letterPerCycle - numRows
        var resultS:[Character]=[]
        var Sarr=Array(s.characters)
        let count=Sarr.count
        var i=0
        while i<count{
            resultS.append(Sarr[i])
            i+=letterPerCycle
        }
        if letterInMid>=1 {
            for j in 1...letterInMid{
                i=j
                while i<count{
                    resultS.append(Sarr[i])
                    i+letterPerCycle-2*j<count ?resultS.append(Sarr[i+letterPerCycle-2*j]):nil
                    i+=letterPerCycle
                }
            }
        }
        i=numRows-1
        while i<count{
            resultS.append(Sarr[i])
            i+=letterPerCycle
        }
//        let endTime = CFAbsoluteTimeGetCurrent()
//        debugPrint("part2：%f 毫秒", (endTime - startTime)*1000)
        return String(resultS)
    }
}
let sol = Solution()
print(sol.convert("PAYPAPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGPAYPALISHIRINGLISHIRING", 3))

