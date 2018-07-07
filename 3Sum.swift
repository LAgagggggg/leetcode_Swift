import Foundation
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let startTime = CFAbsoluteTimeGetCurrent()
        let numSet=Set(nums)
        var nArr:[Int]=Array()
        var pArr:[Int]=Array()
        var gotZero:Int=0
        var result:[[Int]]=Array()
        var previousNum:Int? = nil
        var duplicateCnt=1
        var duplicateSet:Set<Int>=Set()
        for num in nums.sorted(){
            if(num==previousNum){
                duplicateCnt+=1
            }
            else{
                duplicateCnt=1
                previousNum=num
            }
            if num != 0 && duplicateCnt<2{
                num<0 ? nArr.append(num):pArr.append(num)
            }
            else if num != 0 && duplicateCnt>=2{
                duplicateSet.insert(num)
            }
            else if num==0 {gotZero+=1}
        }
        if gotZero>0 {//有0则找一正一负
            if gotZero>=3{
                result.append([0,0,0])
            }
            for nNum in nArr{
                if numSet.contains(-nNum){
                    result.append([nNum,0,-nNum])
                }
            }
        }
        //找有两个相同的
        for dNum in duplicateSet {
            if numSet.contains(-2*dNum){
                dNum>0 ? result.append([-2*dNum,dNum,dNum]):result.append([dNum,dNum,-2*dNum])
            }
        }
        //接着找一负两正且两正不相同
        for nNum in nArr {
            for pNum in pArr{
                if pNum >= (-nNum+1)/2 {break}
                else{
                    if numSet.contains(-(pNum+nNum)){
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
                    if numSet.contains(-(pNum+nNum)){
                        result.append([-(pNum+nNum),nNum,pNum])
                    }
                }
            }
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        debugPrint("代码执行时长：%f 毫秒", (endTime - startTime)*1000)
        return result
    }
}

let s=Solution()
print(s.threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]))
