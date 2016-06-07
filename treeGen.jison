/* Copyright © 2016 TSPrograms. Created on 6/7/16. */

/* lexical grammar */
%lex
%%

\s+                       /* skip whitespace */
("#"+)[^#]([\s\S]*?)\1    /* skip comments */
([\"\'])(.*?)[^\\]\1      return 'STRING'
[0-9]+("."[0-9]+)?\b      return 'NUMBER'
[a-zA-Z_$][a-zA-Z0-9_$]*  return 'IDENTIFIER'
"("                       return '('
")"                       return ')'
"["                       return '['
"]"                       return ']'
"{"                       return '{'
"}"                       return '}'
([-!@])(?=[-!@\s]|\b|$)   return 'UNARY_OP'
"."\b                     return 'PREC_10'
("^"|"->")\b              return 'PREC_20'
[*/%]\b                   return 'PREC_30'
[+-]\b                    return 'PREC_40'
("=="|"==="|"!="|"!==")\b return 'PREC_60'
(">"|">="|"<"|"<=")\b     return 'PREC_60'
[|&]\b                    return 'PREC_70'
","\b                     return 'PREC_80'
"="\b                     return 'PREC_90'
("+="|"-="|"*="|"/=")\b   return 'PREC_90'
("%="|"->="|"^=")\b       return 'PREC_90'
("|="|"&=")\b             return 'PREC_90'
[^a-zA-Z0-9_$\s]+         return 'INFIX_OP' /* prec 50 */
<<EOF>>                   return 'EOF'

/lex

/* operator associations and precedence */
/* TODO */
%left 'PREC_90'
%left 'PREC_80'
%left 'PREC_70'
%left 'PREC_60'
%left 'INFIX_OP'
%left 'PREC_40'
%left 'PREC_30'
%left 'PREC_20'
%left 'PREC_10'
%left 'UNARY_OP'

%start expressions

%% /* language grammar */

expressions
    : e EOF
        {return $1;}
    ;

line
    : line line
        {return {type:"lines",cont:[$1,$2]};}
    | line EOF
        {return $1;}
    | expr expr
        {return {type:"lines",cont:[$1]};}

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
