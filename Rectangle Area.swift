class Solution {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        if E>=C || G<=A || H<=B || F>=D {
        	return ((C-A)*(D-B)+(G-E)*(H-F))
        }
        else {
        	let Warr=[A,C,E,G].sorted()
        	let Harr=[B,D,F,H].sorted()
        	let Width=abs(Warr[1]-Warr[2])
        	let Height=abs(Harr[1]-Harr[2])
        	return	((C-A)*(D-B)+(G-E)*(H-F))-Width*Height
        }
    }
}