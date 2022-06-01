Mealy-encode

Thinking process: 
	Algorithm: Σ={0,1}, ab={00,01,10,11}, c={0,1}
	F(ab,c) = a'b',output
	We take 1 input for 1 triad → ab is pairs of Σ in total 2 length. 
We always get 1 output and the ab maps 	ALSO	in a 2 length word.

	ex. ...10101...
		State assume 1:→ F(10,1) = 01, 0
		State assume 2:→ F(01,0) = 10, 1
		….We expect to see 8 arrows total of 
		(4 stages)*2 inputs.
TABLE OF TRANSITIONS:
	From (one&second → second&third)
	odd ACES → 1 ELSE 0
	(initial, input → final, output)
	00,0 → none → 00, 0
	01,0 → odd → 10, 1
	10,0 → odd → 00, 1
	11,0 → even → 10, 0
	00,1 → odd → 01, 1
	01,1 → even → 11, 0
	10,1 → even → 01, 0
	11,1 → odd → 11, 1

This is exactly the table + one transition per state for @
which ends a string. @=00+@
ex. ASSUME 01@:01,00 → 10,0 → 00,@ → end, Output=00

Example for you to test: 

input: 010100100100
input: 0101001001@
output: 1011111111

input: 01010111000101010011100010100
input: 010101110001010100111000101@
output: 101001010110101110101011011