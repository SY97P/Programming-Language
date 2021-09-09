let sum n = 
  if n<=0 then 0 else n*(n+1)/2;;
(*
sum;;
sum (-10);;
sum 100;;
*)

let circle r = 
  if r<=0.0 then (0.0) else 3.14*.r*.r;;
(*
circle;;
circle (-10.1);;
circle 4.2;;
*)

let concat s = "Hello "^ s;;
(*
concat;;
concat "Bob!";;
concat "Alice!";;
*)

let xor (x : bool) (y: bool) = 
  if x=y then false else true ;;
(*
xor;;
xor true true;;
xor true false;;
xor false true;;
xor false false;;
*)

let triangle x y z = 
  if (x<=0)||(y<=0)||(z<=0) then false 
  else if (x<y+z)&&(y<x+z)&&(z<x+y) then true
  else false;;
(*
triangle;;
triangle (-3) 3 1;;
triangle 3 4 5;;
triangle 100 1 2;;
*)

let int_if_then_else b x y = 
  if b then x+y else x-y;;
(*
int_if_then_else;;
int_if_then_else true 2 100;;
int_if_then_else (100<2) 2 (-2);;
*)

let sum_of_fun_val a b c d e = 
  let sumF x = a*x*x + b*x + c in (sumF d)+(sumF e);;
(*
sum_of_fun_val;;
sum_of_fun_val 1 2 1 3 4;;
sum_of_fun_val 1 (-3) (-1) 200 123;;
*)

let comp3 a b c d = 
  let sumF x = a*x*x + b*x + c in sumF(sumF(sumF d));;
(*
comp3;;
comp3 1 1 1 1;;
comp3 1 (-2) 1 3;;
*)

let string2 s = s^s;;
(*
string2;;
string2 "hi";;
string2 "abcde";;
*)

let string256 s = 
  let a = s^s in
  let b = a^a in
  let c = b^b in
  let d = c^c in
  let e = d^d in
  let f = e^e in
  let g = f^f in
    g^g;;
(*
string256;;
string256 "a";;
string256 "ab";;
*)
