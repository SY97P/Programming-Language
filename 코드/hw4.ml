exception NotImplemented

let rec list_add (lst1:int list) (lst2:int list) = 
  match lst1 with
    | [] -> lst2
    | h1::t1 ->
        match lst2 with
          | [] -> lst1
          | h2::t2 -> (h1 + h2)::list_add t1 t2
;;

list_add [1;2] [3;4;5];;
list_add [3;4;5] [1;2];;
list_add [] [3;4;5];;
list_add [3;4;5] [];;


let rec insert (n:int) (lst:int list) =
  match lst with
    | [] -> [n]
    | h::t -> if n > h then h::insert n t else n::h::t
;;

insert 3 [1;2;4;5];;
insert 3 [1;5;6];;
insert 3 [];;


let rec insort (lst:int list) = 
  match lst with
    | [] -> []
    | h::t -> insert h (insort t)
;;

insort [3;7;5;1;2];;
insort [7;5;3;2;1];;
insort [3;1;2];;
insort [1;2;4;3;5];;



let rec ltake lst (n:int) =
  match lst with
    | [] -> []
    | h::t -> if n>0 then h::ltake t (n-1) else []
;;


ltake [3; 7; 5; 1; 2] 3 ;;
ltake [3; 7; 5; 1; 2] 7 ;;
ltake ["h"; "y"; "e"; "o"; "n"; "s"; "e"; "u"; "n"; "g"] 5 ;;


let rec lall funct lst = 
  match lst with
    | [] -> true
    | h::t -> if funct h then lall funct t else false
;;

lall (fun x -> x > 0) [];;
lall (fun x -> x > 0) [1; 2; 3] ;;
lall (fun x -> x > 0) [1; -2; 3] ;;


let rec lmap f lst =
  match lst with
    | [] -> []
    | h::t -> (f h)::lmap f t
;;

lmap (fun x -> x + 1) [1; 2; 3] ;;


let rec lfilter func lst =
  match lst with
    | [] -> []
    | h::t -> if func h then h::lfilter func t else lfilter func t
;;

lfilter (fun x -> x > 2) [0; 1; 2; 3; 4; 5];;


let rec ltabulate n func =
  if n > 0 then ltabulate (n-1) func @ [func (n-1)] else []
;;

ltabulate 4 (fun x -> x * x);;


let rec lrev lst =
  match lst with
    | [] -> []
    | h::t -> lrev t @ [h]
;;

lrev [1; 2; 3; 4];;


let rec lconcat lst =
  match lst with 
    | [] -> []
    | h::t -> h @ lconcat t
;;

lconcat [[1; 2; 3]; [6; 5; 4]; [9]];;


let rec lfoldl func e lst =
  match lst with
    | [] -> e
    | h::t -> lfoldl func (func (h, e)) t
;;

lfoldl (fun (x, y) -> x - y) 0 [1; 2; 3];;
	
	
let rec lzip lst1 lst2 =
  match lst1 with
    | [] -> []
    | h1::t1 -> 
        match lst2 with
          | [] -> []
          | h2::t2 -> (h1, h2)::lzip t1 t2
;;

lzip ["A"; "B"; "C"; "D"] [1; 2; 3; 4; 5; 6] ;;


let rec split lst =
  match lst with
    | [] -> (lst, lst)
    | h1::h2::t -> h1::(match split t with
                         | (h, _) -> h ), 
                   h2::(match split t with
                         | (_, h) -> h)
;;


split [1; 3; 5; 7; 9; 11];;
split [];;



let rec cartprod lst1 lst2 =
  match lst1 with
    | [] -> []
    | ha::t1 -> 
        match lst2 with 
          | [] -> []
          | h2::t2 -> if t2!=[] then (ha, h2)::cartprod lst1 t2 else cartprod t1 lst2
;;

cartprod [1; 2] [3; 4; 5] ;;


