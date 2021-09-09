(*
 * abstract syntax definition for KML
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
| LETREC of var * var * exp * exp
| FUN of var * exp
| APP of exp * exp
and var = string

type value =
  Int of int
| Bool of bool
| Closure of var * exp * env
| RecClosure of var * var * exp * env
and env = var -> value

let empty_env = fun _ -> raise (Failure "Environment is empty")
let extend_env (x, v) e = fun y -> if x = y then v else e y
let apply_env e x = e x
