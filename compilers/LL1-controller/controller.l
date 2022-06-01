%{
#include <stdio.h>
#include <string.h>

/* Needed for syntax analyser*/
#define LEXEND 0
#define TK_CONTROL 200
#define TK_INITIALIZE 201
#define TK_CHECK_SYS 202
#define TK_THERMO 203
#define TK_SWITCH_ON 204
#define TK_TEMPER 205
#define TK_LEFT_BRACE 206
#define TK_RIGHT_BRACE 207
#define TK_DOTS 208
#define TK_OP 209
#define TK_NUM 210

typedef union attribute{
	int i;
	char s[200];
}attributeU;

attributeU attribute;
int line = 1;

%}

newline \n|\x0A|\x0D|\x0A
space \t|" "
op ">"|"<"|"="
num [0-9]+

%%
"control" {strcpy(attribute.s,yytext);return TK_CONTROL;}
"initialize" {strcpy(attribute.s,yytext);return TK_INITIALIZE;}
"check-sys" {strcpy(attribute.s,yytext);return TK_CHECK_SYS;}
"thermo" {strcpy(attribute.s,yytext);return TK_THERMO;}
"switch-on" {strcpy(attribute.s,yytext);return TK_SWITCH_ON;}
"heat"|"cold" {strcpy(attribute.s,yytext);return TK_TEMPER;}
"{" {strcpy(attribute.s,yytext);return TK_LEFT_BRACE;}
"}" {strcpy(attribute.s,yytext);return TK_RIGHT_BRACE;}
":" {strcpy(attribute.s,yytext);return TK_DOTS;}
{op} {strcpy(attribute.s,yytext);return TK_OP;}
{num} {attribute.i = atoi(yytext);return TK_NUM;}
{space} {/* Do nothing */}
. {printf("Unexpected Character %s line %d\n",yytext,line);}
{newline} {line++;}
%%
int token = 0;
void error_syntax();
void match(int tk);

void controller();
void rules();
void rls();
void rule();
void event();
void action();

void controller(){
	if(token == TK_CONTROL){
		match(TK_CONTROL);match(TK_LEFT_BRACE);rules();match(TK_RIGHT_BRACE);
	}else if(token != LEXEND){
		error_syntax();
	}
}

void rules(){
	if(token == TK_INITIALIZE){
		match(TK_INITIALIZE);rls();
	}else if(token != TK_RIGHT_BRACE){
		error_syntax();
	}
}

void rls(){
	if(token == TK_THERMO || token == TK_CHECK_SYS){
		rule();rls();
	}else if(token != TK_RIGHT_BRACE){
		error_syntax();
	}
}

void rule(){
	if(token == TK_THERMO){
		event();match(TK_DOTS);action();
	}else if(token == TK_CHECK_SYS){
		match(TK_CHECK_SYS);
	}else if(token != TK_CHECK_SYS && token != TK_THERMO){
		error_syntax();
	}
}

void event(){
	if(token == TK_THERMO){
		match(TK_THERMO);match(TK_OP);match(TK_NUM);
	}else if(token != TK_DOTS){
		error_syntax();
	}
}

void action(){
	if(token == TK_SWITCH_ON){
		match(TK_SWITCH_ON);match(TK_TEMPER);
	}else if(token != TK_CHECK_SYS && token != TK_THERMO){
		error_syntax();
	}
}


// Function for error reporting
void error_syntax(void){
   printf("Syntax Error reading %s at line %d of input. \n",yytext, line);
   exit(-1);
}
// Function to request the next token. 
void match(int tk){

   if (token == tk) token = yylex();
   else  error_syntax();
}

int main(int argc, char **argv ){
   ++argv, --argc;  /* skip over program name */
   if ( argc > 0 )
       yyin = fopen( argv[0], "r" );
   else
      yyin = stdin;

   token = yylex(); 
   // Add top level function to call here
   controller();
   
   if (token == LEXEND) printf("\n Success! \n \n");
   else error_syntax();
   
   return 0; 
}