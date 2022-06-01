For each state we give output. This means that we have to account for 3 parts of a triad to determine the output. 
We have ONE input at a state and 2 outputs.(from 2 input options).
This means we need states=2*states
where a state holds info that together with input we can determine the output.
The states represent the info of 
3-1(triad – input)= 2. 2 characters from Σ=(0,1)
which is a total of 4 states(2*size(Σ)).
In the end due to outputs → states = 2 *4 = 8

(state(second|input,output))
00 → 0= state(00,0)
00 → 1= state(01,1)
01 → 1= state(11,0)
01 → 0= state(10,1)
10 → 1= state(01,0)
10 → 0= state(00,1)
11 → 0= state(10,0)
11 → 1= state(11,1)
EXAMPLE :state(10,1) → 0 = state(01,1) -> state(10,1) → 1 = state(01,0) 
The moore is exactly the above transitions.

010100100100
1011111111

01010111000101010011100010100
101001010110101110101011011