(* 
 * hw5.ml
 * Feel free to define any helper functions.
 * You don't need to define a recursive function if possible.
 *)

exception NotImplemented

(**********************************)
(*            Problem 1           *)
(**********************************)
module Problem1 = struct
  open Lambda
    
  let rec check : exp -> bool =
    fun _ -> raise NotImplemented
end

(**********************************)
(*            Problem 2           *)
(**********************************)
module Problem2 = struct
  open Kml
  exception Error    
	
  let rec run : program -> value =
    fun _ -> raise NotImplemented
end

(***********************************)
(*            Problem 3            *)
(***********************************)
module Problem3 = struct
  open Nameless
  exception CannotTranslate
	
  let rec translate : program -> nl_program =
    fun _ -> raise NotImplemented
end

(**********************************)
(*            Problem 4           *)
(**********************************)
module Problem4 = struct
  open Nameless
  exception Error
      
  let rec nl_run : nl_program -> nl_value =
    fun _ -> raise NotImplemented
end
