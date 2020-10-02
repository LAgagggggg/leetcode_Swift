class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        if accounts.count == 0 {
            return []
        }
        var resultSet = Array<(name: String, emails:Set<String>)>()
        
        for account in accounts {
            let emails = account[1...]
            var notContain = true
            let emailSet = Set(emails)
            var lastTriggerSet = -1
            var i = 0
            while i < resultSet.count {
                var set = resultSet[i]
                if set.emails.intersection(emailSet).count > 0 {
                    notContain = false
                    if lastTriggerSet == -1 { // First set contain same email
                        lastTriggerSet = i
                        resultSet[i].emails = set.emails.union(emailSet)
                    }
                    else { // More set hit
                        resultSet[lastTriggerSet].emails = resultSet[lastTriggerSet].emails.union(resultSet[i].emails)
                        resultSet.remove(at: i)
                        i -= 1
                    }
                }
                i += 1
            }
            if notContain {
                resultSet.append((name: account[0], emails: emailSet))
            }
        }
        let result = resultSet.map { (arg: (name: String, emails: Set<String>)) -> [String] in
            let (name, emails) = arg
            var result = [name]
            result.append(contentsOf: emails.sorted())
            return result
        }
        return result
    }
}

print(Solution().accountsMerge([["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]))
