package AnalizadorLexico;
import static AnalizadorLexico.Token.*;
%%
%class Lexer

%type Token
L = [a-zA-Z]
D = [0-9]

NUMERO = [0-9]+\\.?[0-9]+
WHITE=[ \t\r\n]
%{
    public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
"//" {/*Ignore*/}
"="  {return ASIGNAR;}
"==" {return IGUAL;}
"!=" {return DIFERENTE;}
"+"  {return SUMA;}
"*"  {return MUL;}
"-"  {return RESTA;}
"/"  {return DIV;}
"'"  {return COMILLA;}
"("  {return PARENTESIS_ABIERTO;}
")"  {return PARENTESIS_CERRADO;}
">"  {return MAYOR;}
"<"  {return MENOR;}
"["  {return CORCHETE_ABIERTO;}
"]"  {return CORCHETE_CERRADO;}
"{"  {return LLAVE_ABIERTA;}
"}"  {return LLAVE_CERRADA;}
";"  {return PUNTO_Y_COMA;}
","  {return COMA;}

"\"" [^*] ~"\"" | "\"" + "\'" //expresion regular para definir cadenas
{

    return CADENA;
}

"caracter"
{
    return PALABRA_RESERVADA;
}

"ent"
{
    return PALABRA_RESERVADA;
}
"dec"
{
    return PALABRA_RESERVADA;
}

"fdec"
{
    return PALABRA_RESERVADA;
}

"largo"
{
    return PALABRA_RESERVADA;
}

"cad_caracter"
{
    return PALABRA_RESERVADA;
}

"bool"
{
    return PALABRA_RESERVADA;
}

"defect"
{
    return PALABRA_RESERVADA;
}

"escribe"
{
    return PALABRA_RESERVADA;
}

"save"
{
    return PALABRA_RESERVADA;
}

"ejecutar"
{
    return PALABRA_RESERVADA;
}

"finalizar"
{
    return PALABRA_RESERVADA;
}

"caso"
{
    return PALABRA_RESERVADA;
}

"haz"
{
    return PALABRA_RESERVADA;
}

"durante"
{
    return PALABRA_RESERVADA;
}

"yes"
{
    lexeme = yytext();
    return PALABRA_RESERVADA;
}

"YES" | "YEs" | "Yes" | "yeS" | "yES" | "yEs" | "YeS"
{
    
    lexeme=yytext();
    return ERROR;
}

"otro_caso"
{
    return PALABRA_RESERVADA;
}

"bucle"
{
    return PALABRA_RESERVADA;
}

"retorna"
{
    return PALABRA_RESERVADA;
}

"verdad"
{
    return PALABRA_RESERVADA;
}

"mentira"
{
    return PALABRA_RESERVADA;
}

"para"
{
    return PALABRA_RESERVADA;
}

(NUMERO)
{
    lexeme="";
    lexeme=yytext();
    return NUMERO;
}

{L}({L}|{D})* //lenguaje de variables
{
    lexeme=yytext();
    return ID;
}

{D}({L}|{D})* //lenguaje de variables erroneas
{
    lexeme=yytext();
    return ERROR;
}

.//todo lo que no este definido en el lenguaje
{
    lexeme=yytext();return ERROR;
}