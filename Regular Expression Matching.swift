class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var sArr=Array(s.characters)
        var pArr=Array(p.characters)
        let sCnt=s.count
        let pCnt=p.count
        var i=0,j=0
        mainWhile: while i<sCnt && j<pCnt {
            if i<0 {
                i=0
            }
            var isNextStar=false
            let theCharacter=pArr[j]
            if j != pCnt-1 { isNextStar = pArr[j+1]=="*" ? true:false}
            if isNextStar {// is "*"?
                let nextRequire:Character? = j+2<pCnt ? pArr[j+2]:nil
                var backCnt=0
                var nextRequireArr:[Character]=Array()
                if theCharacter==nextRequire && theCharacter != "."{//
                    while(j+2+backCnt<pCnt && pArr[j+2+backCnt]==theCharacter){
                        backCnt+=1
                    }
                }
                else if(j+3<pCnt && pArr[j+3]=="*"){
                    var ignoreCnt=3
                    while(j+ignoreCnt<pCnt && pArr[j+ignoreCnt]=="*"){
                        nextRequireArr.append(pArr[j+ignoreCnt-1])
                        ignoreCnt+=2
                    }
                    if(j+ignoreCnt-1<pCnt){
                        nextRequireArr.append(pArr[j+ignoreCnt-1])
                    }
                    ignoreCnt-=1
                    while(j+ignoreCnt+backCnt<pCnt && pArr[j+ignoreCnt+backCnt]==theCharacter){
                        backCnt+=1
                    }
                }
                if theCharacter != "."{
                    while sArr[i] == theCharacter{
                        i+=1
                        if !(i<sCnt) {
                            if(backCnt>0){
                                i-=backCnt;
                                j+=2
                                continue mainWhile
                            }
                            else{
                                break mainWhile
                            }
                        }
                    }
                    for k in 0..<nextRequireArr.count{
                        let c=nextRequireArr[k]
                        if c==sArr[i] && c != theCharacter{
                            j+=2
                            continue mainWhile
                        }
                        else if c==theCharacter && k==nextRequireArr.count-1{
                            i-=backCnt
                            j+=2
                            continue mainWhile
                        }
                        else if c=="." && k==nextRequireArr.count-1{
                            print("fuck")
                            j+=2
                            continue mainWhile
                        }
                        else{
                            j+=2
                        }
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
                        j+=2
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
print(s.isMatch("acaabbaccbbacaabbbb", "a*.*b*.*a*aa*a*"))
