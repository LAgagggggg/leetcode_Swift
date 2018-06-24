class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
    	let letterPerCycle=(2*numRows-2)
        let colCnt=s.count/letterPerCycle
        let letterInMid=letterPerCycle - numRows
        let remainedCnt=s.count-colCnt*letterPerCycle
        var resultS:String
        var modifiedS=s
        for _ in 0..<remainedCnt{
        	modifiedS+="*"
        }
        var i=0
        while i<modifiedS.count{
        	resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i)])
        	i+=letterPerCycle
        }
        for j in 1...letterInMid{
        	i=j
        	while i<modifiedS.count{
        		resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i)])
        		resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i+letterPerCycle-2*j)])
        		i+=letterPerCycle
        	}
        }
        i=numRows
        while i<modifiedS.count{
        	resultS+=String(modifiedS[modifiedS.index(modifiedS.startIndex, offsetBy:i)])
        	i+=letterPerCycle
        }
        return resultS.replacingOccurrences(of:"*", with: "")
    }
}