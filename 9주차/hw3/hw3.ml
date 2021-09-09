(* hw3.ml *)

exception NotImplemented

let rec sum n =
  if n = 1 then 1 else n + sum(n-1)
;;
let rec fac n = 
  if n = 1 then 1 else n * fac(n-1)
;;
let rec fib n = 
  if n < 2 then 1 else fib(n-1) + fib(n-2)
;;
let rec gcd a b = 
  if a = 0 then b 
  else gcd (let c = b mod a in c) a
;;

let rec max lst = 
  match lst with
    | [] -> 0
    | h::t -> if h > max t then h else max t
;;

type tree = Leaf of int | Node of int * tree * tree

let rec sum_tree t = 
  match t with 
    | Leaf n -> n
    | Node (n, t1, t2) -> n + sum_tree t1 + sum_tree t2
;;
let rec depth t = 
  match t with
    | Leaf _ -> 0
    | Node (_, t1, t2) -> if depth t1 > depth t2 then depth t1+1 else depth t2+1
;;
let rec bin_search t x = 
  match t with 
    | Leaf n -> if n = x then true else false
    | Node (n, t1, t2) -> 
        if n = x then true
        else if n > x then bin_search t1 x else bin_search t2 x
;;

type exp =
      INT of int
    | ADD of exp * exp
    | SUB of exp * exp
    | MUL of exp * exp
    | DIV of exp * exp
    | MOD of exp * exp

let rec interp e = 
  match e with
    | INT n -> n
    | ADD (n1, n2) -> interp n1 + interp n2
    | SUB (n1, n2) -> interp n1 - interp n2
    | MUL (n1, n2) -> interp n1 * interp n2
    | DIV (n1, n2) -> interp n1 / interp n2
    | MOD (n1, n2) -> interp n1 mod interp n2
;;

type formula =
      True
    | False
    | Neg of formula
    | Or of formula * formula
    | And of formula * formula
    | Imply of formula * formula

let rec eval f = 
  match f with 
    | True -> true
    | False -> false
    | Neg f1 -> not(eval f1)
    | Or (f1, f2) -> eval f1 || eval f2
    | And (f1, f2) -> eval f1 && eval f2
    | Imply (f1, f2) -> not(eval f1) || eval f2
;;



(*
sum 10 ;;

fac 4 ;;

fib 0 ;;
fib 1 ;;
fib 2 ;;

gcd 15 20;;
gcd 5 15 ;;
gcd 0 5 ;;

gcd 3 4 ;;
gcd 10 100 ;;

max [5; 3; 6; 7; 4];;
max [];;
max [1; 2; 3; 4; 5; 6];;
max [7; 6; 5; 4; 3; 2];;

sum_tree(Node (7, Node (3, Leaf 1, Leaf 2), Leaf 4));;

depth (Node (7, Node (3, Leaf 1, Leaf 2), Leaf 4)) ;;
depth(Node(1, Node(2, Node(4, Leaf 12, Leaf 13), Node(5, Leaf 14, Node(6, Leaf 15, Leaf 16))), Node(3, Leaf 10, Leaf 11)));;

bin_search (Node (4, Node(2, Leaf 1, Leaf 3), Leaf 7)) 2;;
bin_search (Node (4, Node (2, Leaf 1, Leaf 3), Leaf 7)) 5 ;;

interp (ADD (SUB (INT 100, INT 10), MUL (INT 2, INT 8))) ;;

eval (Imply (And (True, Or (True, False)), False)) ;;
*)

