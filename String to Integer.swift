enum firstCharacter {
    case number
    case minus
    case others
    case plus
}
class Solution {
    func myAtoi(_ str: String) -> Int {
        if str.count<1 {
            return 0
        }
        var cArr=Array<Character>(str)
        var firstC:firstCharacter?=nil
        var numInProcess:Bool=false
        var firstNotZero:Bool=false
//        var endIndex:Int=0
        var i:Int=0
        while (i<cArr.count) {
            let c=cArr[i]
            if c != " " {
                if c<="9"&&c>="0"{
                    numInProcess=true
                    if(!firstNotZero && c=="0"){
                        
                        cArr.remove(at:i)
                        continue
                    }
                    firstC==nil ?firstC=firstCharacter.number:nil
                    firstNotZero=true
                    i+=1
                    continue
                }
                else if c=="-"{
                    firstC==nil ?firstC=firstCharacter.minus:nil
                    if(numInProcess) {break}
                    numInProcess=true
                }
                else if c=="+"{
                    firstC==nil ?firstC=firstCharacter.plus:nil
                    if(numInProcess) {break}
                    numInProcess=true
                }
                else{
                    if(!numInProcess){
                        firstC=firstCharacter.others
                        return 0
                    }
                    break
                }
            }
            else {
                if(numInProcess) {break}
                cArr.remove(at:i)
                i-=1
            }
            i+=1
        }
        if i<1 {
            return 0
        }
        var result = Int64(String(cArr[0...i-1])) ?? 0
        if String(cArr[0...i-1]).count>10 && result==0 {
            return firstC==firstCharacter.minus ? -2147483648:2147483647
        }
        result>2147483647 ? result=2147483647:nil
        result < -2147483648 ? result = -2147483648:nil
        return Int(result)
    }
}
var sol=Solution()
print(sol.myAtoi("+ 123"))
