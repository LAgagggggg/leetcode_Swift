class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var sArr=Array(s.characters)
        var pArr=Array(p.characters)
        return match(sArr, pArr)
    }
    func match(_ s:[Character], _ p:[Character]) -> Bool {
        if p.isEmpty {
            return s.isEmpty
        }
        let firstMatch:Bool = (!s.isEmpty && (p[0]==s[0] || p[0] == "."))
        if p.count>=2 && p[1] == "*" {
            return (match(s,Array(p[2..<p.count])) || (firstMatch && match(Array(s[1..<s.count]),p)))
        }
        else{
            return firstMatch && match(Array(s[1..<s.count]),Array(p[1..<p.count]))
        }
    }
}