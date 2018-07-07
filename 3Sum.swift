
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count<=2 || nums.max()!<0 || nums.min()!>0 {return []}
//        let numSet=Set(nums)
        let max=[nums.max()!,-nums.min()!].max()!
        var pNumArr=Array.init(repeating:0,count:max+1)
        var nNumArr=Array.init(repeating:0,count:max+1)
        var nArr:[Int]=Array()
        var pArr:[Int]=Array()
        var gotZero:Int=0
        var result:[[Int]]=Array()
//        var duplicateSet:Set<Int>=Set()
        for num in nums.sorted(){
            if num>0 {pNumArr[num]+=1}
            else {nNumArr[-num]+=1}
            let judge = num>0 ? pNumArr[num]:nNumArr[-num]
            if num != 0 && judge==1{
                num<0 ? nArr.append(num):pArr.append(num)
            }
            else if num==0 {gotZero+=1}
        }
        if gotZero>0 {//有0则找一正一负
            if gotZero>=3{
                result.append([0,0,0])
            }
            for nNum in nArr{
                if pNumArr[-nNum]>0{
                    result.append([nNum,0,-nNum])
                }
//                if numSet.contains(-nNum){
//                    result.append([nNum,0,-nNum])
//                }
            }
        }
        //找有两个相同的
        for num in nArr where num%2==0{
            if pNumArr[-num/2]>=2{
                result.append([num,-num/2,-num/2])
            }
        }
        for num in pArr where num%2==0{
            if nNumArr[num/2]>=2{
                result.append([-num/2,-num/2,num])
            }
        }
//        for dNum in duplicateSet {
//
//            if numSet.contains(-2*dNum){
//                dNum>0 ? result.append([-2*dNum,dNum,dNum]):result.append([dNum,dNum,-2*dNum])
//            }
//        }
        //接着找一负两正且两正不相同
        for nNum in nArr {
            for pNum in pArr{
                if pNum >= (-nNum+1)/2 {break}
                else{
//                    if numSet.contains(-(pNum+nNum)){
//                        result.append([nNum,pNum,-(pNum+nNum)])
//                    }
                    if pNumArr[-(pNum+nNum)]>0{
                        result.append([nNum,pNum,-(pNum+nNum)])
                    }
                }
            }
        }
        //两负一正且两负不相同
        for pNum in pArr {
            for nNum in nArr.reversed(){
                if -nNum >= (pNum+1)/2 {break}
                else{
//                    if numSet.contains(-(pNum+nNum)){
//                        result.append([-(pNum+nNum),nNum,pNum])
//                    }
                    if nNumArr[(pNum+nNum)]>0{
                        result.append([-(pNum+nNum),nNum,pNum])
                    }
                }
            }
        }
        return result
    }
}