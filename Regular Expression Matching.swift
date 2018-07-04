class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var sArr=Array(s.characters)
        var pArr=Array(p.characters)
        let sCnt=s.count
        let pCnt=p.count
        var i=0,j=0
        mainWhile: while i<sCnt && j<pCnt {
            var isNextStar=false
            let theCharacter=pArr[j]
            if j != pCnt-1 { isNextStar = pArr[j+1]=="*" ? true:false}
            if isNextStar {// is "*"?
                let nextRequire:Character? = j+2<pCnt ? pArr[j+2]:nil
                if theCharacter != "."{
                    while sArr[i] == theCharacter{
                        i+=1
                        if !(i<sCnt) {break mainWhile}
                    }
                    if sArr[i] != nextRequire && nextRequire != "."{
                        return false
                    }
                    else{
                        j+=2
                        continue
                    }
                }
                else{
                    if(nextRequire != nil){
                        while sArr[i] != nextRequire{
                            i+=1
                            if !(i<sCnt) {break mainWhile}
                        }
                        continue mainWhile
                    }
                    else{
                        return true
                    }
                }
            }
            else{
                if theCharacter != "." { // is "."?
                    if sArr[i] != theCharacter{//match?
                        return false
                    }
                    else{
                        i+=1
                        j+=1
                        continue
                    }
                }
                else{
                    i+=1
                    j+=1
                    continue
                }
            }
        }
        if i<sCnt {
            return false
        }
        if j<pCnt{
            while j<pCnt{
                if(j+1>=pCnt || pArr[j+1] != "*") {return false}
                j+=2
            }
        }
        return true
    }
}

let s=Solution()
print(s.isMatch("ab", ".*c"))
