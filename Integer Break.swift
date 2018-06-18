class Solution {
	//if a number greater or equal than 5, take 5 for example, it can be separate to 2 and 3, 
	//which product if greater than itself. So the number must be separate to a serial of 3 or 4 or 2
    func integerBreak(_ n: Int) -> Int {
    	let count3=n/3
    	var result=1
    	if n==2 {
    		return 1
    	}
    	if n==3 {
    		return 2
    	}
        if n%3==0 {
        	for _ in 0..<count3{
        		result*=3
        	}
        }
        else {
        	if (n-1)%3==0 {
        		for _ in 0..<count3-1{
        			result*=3
        		}
        		result*=4
        	}
        	else {
        		for _ in 0..<count3{
        			result*=3
        		}
        		result*=2
        	}
        }
    	return result
    }
}

var s = Solution()
let result = s.integerBreak(58)
print(result)