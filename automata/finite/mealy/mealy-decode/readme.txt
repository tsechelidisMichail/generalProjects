Mealy-decode

Thinking process: 
	Algorithm: Σ={0,1}, ab={00,01,10,11}, c={0,1}
	F(ab,c) = a'b',output
	We take 1 input for 1 triad → ab is pairs of Σ in total 2 length. 
We always get 1 output and the ab maps 	ALSO	in a 2 length word.

		….We expect to see 8 arrows total of 
		(4 stages)*2 inputs.
TABLE OF TRANSITIONS:
	From (output&second ← second&first)
	1 ELSE 0 ← odd ACES
	00,0← none ← 0,00
	10,1← odd ← 1,00
	10,1← odd ← 0,01
	00,0← even ← 1,01
	11,1← odd ← 0,10
	01,0← even ← 1,10
	01,0← even ← 0,11
	11,1← odd ← 1,11

WE ASSUMED AT ENCODE THAT WE ENDED WITH 00 → START NOW IS 00.

Example to try:      
	1011111111
reversed:1111111101  (10 digits)
output:	  1001001010 (10 digits)
reversed:0101001001
	=0101001001@
	=010100100100