(*
 * abstract syntax definition for Nameless KML
 *)

type program = exp
and exp =
  NUM of int
| VAR of var
| ADD of exp * exp
| SUB of exp * exp
| MUL of exp * exp
| DIV of exp * exp
| UMINUS of exp
| EQ of exp * exp
| LE of exp * exp
| LT of exp * exp
| GE of exp * exp
| GT of exp * exp
| NOT of exp
| OR of exp * exp
| AND of exp * exp
| ISZERO of exp
| IF of exp * exp * exp
| LET of var * exp * exp
| FUN of var * exp
| APP of exp * exp
and var = string

type nl_program = nl_exp
and nl_exp =
  NL_NUM of int
| NL_VAR of int
| NL_ADD of nl_exp * nl_exp
| NL_SUB of nl_exp * nl_exp
| NL_MUL of nl_exp * nl_exp
| NL_DIV of nl_exp * nl_exp
| NL_UMINUS of nl_exp
| NL_EQ of nl_exp * nl_exp
| NL_LE of nl_exp * nl_exp
| NL_LT of nl_exp * nl_exp
| NL_GE of nl_exp * nl_exp
| NL_GT of nl_exp * nl_exp
| NL_NOT of nl_exp
| NL_OR of nl_exp * nl_exp
| NL_AND of nl_exp * nl_exp
| NL_ISZERO of nl_exp
| NL_IF of nl_exp * nl_exp * nl_exp
| NL_LET of nl_exp * nl_exp
| NL_FUN of nl_exp
| NL_APP of nl_exp * nl_exp

type nl_value =
  NL_Int of int
| NL_Bool of bool
| NL_Closure of nl_exp * nl_env
and nl_env = nl_value list
