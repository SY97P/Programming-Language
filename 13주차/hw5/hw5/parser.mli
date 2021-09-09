type token =
  | NUM of (int)
  | VAR of (string)
  | BOOLEAN of (bool)
  | PLUS
  | MINUS
  | STAR
  | SLASH
  | EQUAL
  | EQUALEQUAL
  | LE
  | LT
  | GE
  | GT
  | NOT
  | AND
  | OR
  | ISZERO
  | IF
  | THEN
  | ELSE
  | LET
  | IN
  | LETREC
  | LPAREN
  | RPAREN
  | FUN
  | ARROW
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Kml.program
