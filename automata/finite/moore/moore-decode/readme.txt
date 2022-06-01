MOORE DECODER

From encoding experience, we just create the state+output table(ab,c).

input|second|first → output|second, output

States
0,00→ 00,0
0,01→ 10,1
0,10→ 11,1
0,11→ 01,0
1,00→ 10,1
1,01→ 00,0
1,10→ 01,0
1,11→ 11,1

Due to the fact that we use the output as input, if we start putting the states in the graph , we see that some of them are unreachable, so we just delete them. We of course assume that initial we have 00. In the end it is more simple than encoding.

encoded:1011111111
reversed:1111111101
output:	 1001001010
reversed:0101001001
	=0101001001@