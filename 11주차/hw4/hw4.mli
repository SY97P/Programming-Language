exception NotImplemented
  
val list_add : int list -> int list -> int list 
val insert : int -> int list -> int list 
val insort : int list -> int list 
val ltake : 'a list -> int -> 'a list 
val lall : ('a -> bool) -> 'a list -> bool 
val lmap : ('a -> 'b) -> 'a list -> 'b list 
val lfilter : ('a -> bool) -> 'a list -> 'a list 
val ltabulate : int -> (int -> 'a) -> 'a list 
val lrev : 'a list -> 'a list 
val lconcat : 'a list list -> 'a list 
val lfoldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b 
val lzip : 'a list -> 'b list -> ('a * 'b) list 
val split : 'a list -> 'a list * 'a list 
val cartprod : 'a list -> 'b list -> ('a * 'b) list 
