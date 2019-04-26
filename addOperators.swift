//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class Solution {
    
    var nums:[Character]=[]
    var actualNums:[Int]=[]
    var target=0
    
    func addOperators(_ num: String, _ target: Int) -> [String] {
        if num.count==0 {
            return []
        }
        nums = Array<Character>(num)
        actualNums=nums.map({ (c) -> Int in
            return Int(String(c))!
        })
        self.target=target
        var result=[String]()
        recursiveJudge(1, String(nums[0]),0,actualNums[0],.plus,0, &result)
        return result
    }
    
    enum operatorType {
        case plus
        case minus
        case mul
    }
    
    func recursiveJudge(_ index: Int, _ expression: String, _ handling1:Int, _ handling2:Int, _ lastOperator:operatorType, _ value:Int , _ result:inout [String]) {
        if index != nums.count {
            var newValue:Int;
            var newMulValue=handling1;
            var newHandling:Int;
            switch lastOperator{
            case .plus:
                newValue=handling1+handling2
                newHandling=handling2
            case .minus:
                newValue=handling1-handling2
                newHandling=handling2*(-1)
            case .mul:
                newValue=handling1*handling2
                newHandling=newValue
                newMulValue=0
            }
            recursiveJudge(index+1, expression+"+"+String(nums[index]),0,self.actualNums[index],.plus,value+newValue,&result)
            recursiveJudge(index+1, expression+"-"+String(nums[index]),0,self.actualNums[index],.minus,value+newValue,&result)
            recursiveJudge(index+1, expression+"*"+String(nums[index]),newHandling,self.actualNums[index],.mul,value+newMulValue,&result)
            if handling2 != 0{
                recursiveJudge(index+1, expression+String(nums[index]),handling1,handling2*10+actualNums[index],lastOperator,value,&result)
            }
            
        }
        else{
            var finalValue:Int
            switch lastOperator{
            case .plus:
                finalValue=value+handling2
            case .minus:
                finalValue=value-handling2
            case .mul:
                finalValue=value+handling1*handling2
            }
//            print(expression+"  =>  ",finalValue)
            if finalValue==target{
                result.append(expression)
            }
        }
    }
}

print(Solution().addOperators("123456789", 99))
