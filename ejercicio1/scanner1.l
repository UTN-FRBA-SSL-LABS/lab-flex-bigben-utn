%pointer
%option noyywrap

digito [0-9]
digitoHexa [0-9a-fA-F]

letra [a-zA-Z]

%%

 /* Constante octal: 0 seguido de dígitos octales (o solo 0) */
0[0-7]*         { printf("constante octal: %s\n", yytext); }

 /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]         { }

 /* ── DONE: completadas las reglas ──────────── */

[1-9]{digito}*                      { printf("constante decimal: %s\n", yytext); }
(0x|0X){digitoHexa}+                { printf("constante hexadecimal: %s\n", yytext); }
({letra}|_)({letra}|{digito}|_)     { printf("identificador: %s\n", yytext); }
.                                   { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
