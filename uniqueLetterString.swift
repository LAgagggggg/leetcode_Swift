//
//  main.swift
//  leetcode
//
//  Created by LAgagggggg on 2019/3/18.
//  Copyright © 2019 nil. All rights reserved.
//

import Foundation

class BetterSolution {
    func uniqueLetterString(_ S: String) -> Int {
        let N=S.count
        var index = Dictionary<Character, (first:Int,second:Int)>()
        let str = Array<Character>(S)
        var result = 0
        for i in 0..<str.count {
            let c = str[i]
            if index[c] != nil{
                result+=(i-index[c]!.second)*(index[c]!.second-index[c]!.first)
                index[c]!.first=index[c]!.second
                index[c]!.second=i
            }
            else {
                index[c]=(-1,i)
            }
        }
        for (first,second) in index.values {
            result+=(N-second)*(second-first)
        }
        let mod=Int(pow(10.0,9.0))
        return result%(mod+7)
    }
}

class Solution {
    func uniqueLetterString(_ S: String) -> Int {
        if S.count == 0 {
            return 0
        }
        let str = Array<Character>(S)
        var dp = Array(repeating: [0, 1] + Array(repeating: 0, count: str.count - 1), count: S.count)
        var repeatDicts = Array(repeating: Dictionary<Character, Int>(), count: S.count)
        var result = str.count
        for i in 0..<str.count {
            repeatDicts[i][str[i]] = 1
            var j = 2
            while j <= str.count - i {
                switch repeatDicts[i][str[i + j - 1]] {
                case nil:
                    dp[i][j] = dp[i][j - 1] + 1
                    repeatDicts[i][str[i + j - 1]] = 1
                case 1:
                    dp[i][j] = dp[i][j - 1] - 1
                    repeatDicts[i][str[i + j - 1]] = 2
                default:
                    dp[i][j] = dp[i][j - 1]
                }
                result += dp[i][j]
                j += 1
            }
        }
        return result
    }
}

print(BetterSolution().uniqueLetterString("DQWWCHBMGWOVBTGIZABGAPKLHEVYWJKMEVERRAYEKIJCCAIMERANKNDDFDEJICLLMRTHQWCMOZQEZZYZVQKMFUYQSWMGAVESECMLBWNFFKUTXMMULJUMEGJVNHRFWMAEVUVLTMPNWKZJZZBOGNJVQWCBQHYGNYSCHDVMIQIWJWPCJRELXZIIXOOBUUZBYMFYJLKPEACBSMROLPSOBZHWEFXDKJMIPNEMKLFCRAIXTIMEGGTRGYHATLQPCLWRJFQMOHKNHBJRGZVGSRJZDEPFCONBKQCZWTZSEMDUDIJWMNQTHULBOQCUMNFXIALANSFTMKVXEFXJIEOBCBMHBNHJAJHPZCHGXEGEILGYAUROOUCODQVZZAIILGDWRLEQDJODAEVLXSDCVYETZOLSARQCIZCOPLXZDTCUOOXURJDCRAAKCNNTQAHBFWZDZDUNXTXZPVMSENTXYTPOBGPNAHJRKRLDATFBJVWPMHXZMJLSHSRLMZZZZIVDFWBJJPPZDPZUYYVBQZQQGQZFOJOQVUGOEUSDNQDRKVQKBPFBFDXTCTCCWCEJNYGEQJAQZLEJRBVOXIXNUVERKFORUUYQEGIZWMWNQWROMHWJVPOTOLXDZOMATYNKIUONFEJXBUBRAMQKTGERCTAVFTNSBLGCSVEVUOGIXHCPJWAWFZCABBQINTFHMCUNHFTPBJGGNMKUVMRZHVFGPUZEUSSFFDCAFPMBVXAXJSBREPBVRVZPPZWQEFIPZYMTPARCHGTMGGQBKUQSUDWSUYYXTRQLBKSIOIIBUJLAUWHRLPMOVCEECILYTNINLZFQTVDNEIIBZQHYIXAMVUCUGEZFIBSKNPBCLJSZZLIBJCIZTZDIQTFXSVYTIYIHEHLIWIQQUCXLIBHIATBYUVKQAZFTWJXWTWDSQCMTIQMGWZNUHGLFKPVVXHXOIRAOHCKICPKMPUXZMJFNUTTXMPPVDGAJRQGMLPXKRUWGNMJMEQWRYDPDNCBXNGIFERQFIIMGRKHWPCLKZGXFMYJDDSHQEIGAKSBQHXONTPXUUXBSTGOZDESOREQUKRHRFJIOJBXPUWTSUFFOBGLMDDKKHWRAJOGPJEHPOOHJXUVMQSFDDOHVWNBDGTHMAIQGBNRAGQNSJTLDJWVWBLVKLPXROAQZDTZRFFGKGFVOZDQODTBLLSMIPEWJAOFGTWHBESPGGKSRMZZRIEXTKIMEIZWUIEWCQLTPKSLFBLKIOWSBUBSJVZXODSRQUZXXHZSFJVBDLAJAKQTAWHPBRXVMQXGNGEVJFDMNUPXGGZRYGYWCZVDVNXUIWTUMNZGCUKMQVRNXSBGYHNBZHEDSEWSSSSHBCFJJZFYBNORJEGPFLPCIGWJAZIBZITVFJVRNXBWZKEPLBQSRVJESPFHNITENBBJKUNGHZSQHSMEBZJMWSXRZBFNFJTQKPAGNAKMIEAIZTUPHCYEWCIZKIZRSIHDRMOEAEZUNPSXVHQPRTDESTKSIHNIUNCJLKCFQTJTZDQIKBJLNUVJKSDXSDGCPSHEDTXCBZWAHFAXWTGXYIMNXNGXNDWTZNLZLQHGCWQDJLMHZDUYONQACSTHEXUIPDRKSGMBDGMILLNFMMYBJVYCOKWNAEDMRJNRWLKAUUHBVROWIMQLSXBIYMNMUDSWMWJPDZEDCCFNQEIQUZBXQNWQMHGPAFCJJIBCSSPVGYLVJGFWWSZBTLZIXBQOZCPAPVCURCPSEDEOBCDQRRNNWXAYVBVGNIVYSNJHHDPFQZSFTIMCYNIXJIQIZZRJYWZKSXOQZUCALDWIJXJQENIWDYWBXJVESRQTOEEKFMEJCKTBMOYVEQQAANECKLFBAQCUCMKBKFYKFYVOBBGCQZCKTTQTQHRYTZHEWKGDDBGBOSHSMWFMIETKJJRNNSVSCLBURNDHYEXJBFWKAEHDKDUHHJSRCGOECWVUASDSRGSAQRVWCFGSMXBEVIYHQENCCGOXAZESHJIJMXJWJOJQRJGKFIUBVALMDIGDUMAEXWQANDGCJNCAOIYOJDQPCTKHLJXJDTXNLIYOKTBWJXGGGERIMPZPISEOMSPQJOPVOVQJHAXIAMNNYTJNRKTVEARVGQYHNSGXGCYCESNKHZXDPOBDZKPRIBIPRHCRYOIHZBRFDUOOGGFFSGJPAKTBZBYIEPVBIKNBEFTVNHAFFXJHROVXTNWOJYGFZEHUHJGBCQCSQYTJBDINYWEUXQHCWFLVITTSGWGHLWVRUBJCVAHBUBOBYQDDEIZMRLRAZZTIXXSGVOGNMOBFQUFSCCEZKOGOGJFDVWPWRTNBGBJZERXBSEZYPJDVWUEPGIKZZBAAITXSMKSDOUYTOJMBEEUPNVKIWBFDZSDYNOYROVCDOAYEAOGCDQYAIQWUJHGRUWYDNDPTCIHFYKRFBBBQOCDIUBWMWSKRKBIRPUNGMJQVCKBOWBWFZKZHSXGHBNHSEAGSUSZYEVKFIJZGJHKTWEAFVZVQVCVDCRJGJQJY"))

