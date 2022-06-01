Simple syntax validator for LR grammar using flex/bison

========================================================================
First define the tokens to first part of bison. Find terminals.
ex. "to" -> %token T_TO "to"

After take that token and combine it to flex as follows.

%token T_TO "to" -> "to" {return T_TO;}

For num/var/name I could define at first part of flex a regex, but I did it on the second part.
ex. var -> ?[a-zA-Z]* {return T_VAR;}

NOW I moved on to the second part of bison. Just copied the grammar.