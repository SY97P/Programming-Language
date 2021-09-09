(* hw3.mli *)

exception NotImplemented

val sum : int -> int 
val fac : int -> int
val fib : int -> int
val gcd : int -> int -> int
val max : int list -> int 

type tree = Leaf of int | Node of int * tree * tree

val sum_tree : tree -> int
val depth : tree -> int
val bin_search : tree -> int -> bool 
    
type exp =
  INT of int
| ADD of exp * exp
| SUB of exp * exp
| MUL of exp * exp
| DIV of exp * exp
| MOD of exp * exp

val interp : exp -> int

type formula =
  True
| False
| Neg of formula
| Or of formula * formula
| And of formula * formula
| Imply of formula * formula

val eval : formula -> bool
