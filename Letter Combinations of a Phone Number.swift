class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count==0 {
            return []
        }
        var numArr:[Int]=Array()
        var cnt=1
        for c in digits {
            let num=Int(String(c))
            numArr.append(num!)
            cnt *= (num==7 || num==9) ? 4:3
        }
        let num2c:[[Character]]=[["0"],["0"],["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n","o"],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
        var result:[String]=Array.init(repeating: "", count: cnt)
        for num in numArr {
            cnt /= (num==7 || num==9) ? 4:3
            var cPtr = -1
            var i=0
            while i<result.count{
                if i%cnt==0{
                    cPtr+=1
                    if cPtr >= num2c[num].count {cPtr=0}
                }
                result[i].append(num2c[num][cPtr])
                i+=1
            }
        }
        return result
    }
}

let s=Solution()
print(s.letterCombinations("379"))
