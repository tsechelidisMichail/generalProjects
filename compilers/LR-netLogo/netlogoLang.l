/* This is an example of a simple lexer */
%option yylineno

newline \n|\x0A|\x0D|\x0A

%%

"to" {return T_TO;}
"end" {return T_END;}
"to-report" {return T_TO_REPORT;}
"[" {return T_LEFT_BRACE;}
"]" {return T_RIGHT_BRACE;}
"if" {return T_IF;}
"report" {return T_REPORT;}
"<-" {return T_ARROW_LEFT;}
"(" {return T_LEFT_CLOSURE;}
")" {return T_RIGHT_CLOSURE;}
[a-z]* {return T_NAME;}
\?[a-zA-Z]* {return T_VAR;}
[0-9]+ {return T_NUM;}

. {/* Do Nothing */}
{newline} {   }

%%
