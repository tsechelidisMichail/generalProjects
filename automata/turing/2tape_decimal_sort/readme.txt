Turing machine, DECIMAL system, integer sorting.

The problem with this is the fact that the alphabet is 10 characters long.

Σ = {0,1,2,3,4,5,6,7,8,9}

The main problem is comparing 2 characters. Every character needs info about all the others to be compared.

The easiest - Not at all efficient - is to compare 10 times ( static complexity = 10*size(input) ).
This means we do for each character a state which holds info about the other 9.

The easiest way to sort is to just copy corrected the tape into a second one, 
and assume the second's tape output the true output.

(Let's mention that exercise says the needle is far right = far left)

So how to copy in the right way int o the second one? We already determined we need 10 states.

So at every state we traverse the first tape for a number and just copy that to second.
Now do it in the opposite dirrection. And after all that we shall end in a state of

-------------------------NEEDLE@@@@@@@@@@@@@@@----------
----------***************NEEDLE---------

If we wanted to use the tape one as output, then we just create 10 more states from 9-0
and copy the numbers back. At every different number change state SO WE KNOW WHAT TO WRITE.
(that is why we need 10 more states)
(So this answers why I didn't return to initial state as exercise wants, +10 states)
Maybe there is a not so tedious solution, but couldn't think of a way to model the knowledge of every character
about the others. In decimal.