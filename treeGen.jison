/* Copyright © 2016 TSPrograms. Created on 6/7/16. */

/* lexical grammar */
%lex
%%

\s+                       /* skip whitespace */
[0-9]+("."[0-9]+)?\b      return 'NUMBER'
[a-zA-Z_$][a-zA-Z0-9_$]*  return 'IDENTIFIER'
"("                       return '('
")"                       return ')'
"["                       return '['
"]"                       return ']'
"{"                       return '{'
"}"                       return '}'
[^a-zA-Z0-9_$\s]+         return 'OPERATOR'
<<EOF>>                   return 'EOF'

/lex

/* operator associations and precedence */
/* TODO */
%left '+' '-'
%left '*' '/'
%left '^'
%left UNARY

%start expressions

%% /* language grammar */

expressions
    : e EOF
        {return $1;}
    ;
/* TODO */
e
    : e '+' e
        {$$ = $1+$3;}
    | e '-' e
        {$$ = $1-$3;}
    | e '*' e
        {$$ = $1*$3;}
    | e '/' e
        {$$ = $1/$3;}
    | e '^' e
        {$$ = Math.pow($1, $3);}
    | '-' e %prec UMINUS
        {$$ = -$2;}
    | '(' e ')'
        {$$ = $2;}
    | NUMBER
        {$$ = Number(yytext);}
    | E
        {$$ = Math.E;}
    | PI
        {$$ = Math.PI;}
    ;
