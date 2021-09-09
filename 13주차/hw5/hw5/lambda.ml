(*
 * abstract syntax definition for lambda-calculus
 *)

type exp =
  Var of var
| Lambda of var * exp
| App of exp * exp
and var = string


(* examples of closed lambda expressions *)
let w1 = Lambda ("a", Var "a")
let w2 = Lambda ("a", Lambda ("a", Var "a"))
let w3 = Lambda ("a", Lambda ("b", App (Var "a", Var "b")))
let w4 = Lambda ("a", App (Var "a", Lambda ("b", Var "a")))


(* examples of unclosed lambda expressions *)
let i1 = Lambda ("a", Var "b")
let i2 = Lambda ("a", App (Var "a", Lambda ("b", Var "c")))
let i3 = Lambda ("a", Lambda ("b", App (Var "a", Var "c")))
