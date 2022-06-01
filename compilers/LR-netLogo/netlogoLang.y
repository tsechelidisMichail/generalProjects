// Simple NetLogo parser
%{
#include <stdio.h>

int yylex();
extern int yylineno;
extern char* yytext;

void yyerror (const char * msg)
  {
   printf(" Line %d in (%s) -- Error: %s \n",yylineno, yytext,  msg);
  }

%}
%define parse.error verbose

%token T_TO "to"
%token T_END "end"
%token T_TO_REPORT "to-report"
%token T_LEFT_BRACE "["
%token T_RIGHT_BRACE "]"
%token T_IF "if"
%token T_REPORT "report"
%token T_ARROW_LEFT "<-"
%token T_LEFT_CLOSURE "("
%token T_RIGHT_CLOSURE ")"
%token T_NAME "name"
%token T_VAR "var"
%token T_NUM "num"

%%

ProcDef : Procedure ProcDef
	| /*empty*/
	;

Procedure : "to" ProcFunN Body "end"
	| "to-report" ProcFunN Body "end"
	;

ProcFunN : "name" "[" Vars "]"
	;

Vars : /*empty*/
	| "var" Vars
	;

Body : Command
	| Command Body
	;

Command : "if" Call "[" Body "]"
	| "report" VarNum
	| Call
	| "var" "<-" VarNum
	;

Call : "(" "name" Args ")"
	;

Args : VarNum Args
	| Call Args
	| /*empty*/
	;

VarNum : "var"
	| "num"
	;


%%
#include "netlogo.lex.c"

int main(int argc, char **argv ){
   ++argv, --argc;  /* skip over program name */
   if ( argc > 0 )
       yyin = fopen( argv[0], "r" );
   else
      yyin = stdin;

   if (yyparse() == 0) printf("\n Success! \n \n");
   else printf("Parse not Complete.\n");
   return 0;
}
