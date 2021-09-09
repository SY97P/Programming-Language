module Problem1 : sig
  val check : Lambda.exp -> bool
end

module Problem2 : sig
  exception Error
  val run : Kml.program -> Kml.value
end

module Problem3 : sig
  exception CannotTranslate
  val translate : Nameless.program -> Nameless.nl_program
end

module Problem4 : sig
  exception Error
  val nl_run : Nameless.nl_program -> Nameless.nl_value
end
