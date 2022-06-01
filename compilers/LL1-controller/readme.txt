Simple syntax validator, in LL1 format using Flex.

=========================================================================
check grammar for left recursion:

1)direct
Rules ::= Rules Rule ->PROBLEM
2)indirect
Rule ::= Event -> Rule::= "thermo" T_OP T_NUM -> NO PROBLEM
Also no call from 'above' rule for me to check(ex. Event ::= Rule "thermo")


FACTOR left recursion:

Rules ::= "initialize" Rules'
Rules' ::= Rule Rules'
=========================================================================
Code explained :

create rules for every token you see in grammar( with "" or without | terminal or non-terminal)
if something is complex (ex number)  , i may give the regex in the second part or use a macro and define it 
in first part.

DEFINE for every token. Some defines (ex. "cold" & "hot") are defined as same so we can create later the function with
one check (if == TK_TEMPERTURE).

/*
In this step it is advised from the course to create a new rule.
(
Action ::= "switch on" Temperture
Temperture ::= "hot" | "cold"
TK_COLD
TK_HOT
+ function with if cold/if hot + call from action()
)
But my trick worked?! I feel it is equal solution.
Maybe in a more complex grammar i would have a problem?
*/


Then we create functions with left grammar words(ex. controller).
Then we check first for the word. Create if. Match and call with the grammar pattern.
Check follow for the word. Create if!. Call error.


Add a Call from top level symbol at main() ( controller(); ).