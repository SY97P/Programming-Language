(*
 * LETREC interpreter
 *)
let main () =
  let print_code = ref false in
  let lambda_test = ref false in
  let kml_test = ref false in
  let trans_test = ref false in
  let nameless_test = ref false in
  let src = ref "" in
  let spec = [("-pp", Arg.Set print_code, "입력 프로그램 Kml 출력하기");
  ("-p1", Arg.Set lambda_test, "Problem1 : Lambda test");
  ("-p2", Arg.Set kml_test, "Problem2 : Evaluate a KML program");
  ("-p3", Arg.Set trans_test, "Problem3 : Translate a KML program into a nameless program");
  ("-p4", Arg.Set nameless_test, "Problem4 : Evaluate a nameless program")] in
  let usage = "사용법: hw5 <options> <file> \n사용 가능한 옵션들: " in

  let _ = Arg.parse spec
    (fun x ->
      if Sys.file_exists x then src := x
      else raise (Arg.Bad (x ^ ": 파일이 없음")))
    usage
    in
  if !lambda_test then
    let lambda_l1 = [Lambda.w1; Lambda.w2; Lambda.w3; Lambda.w4] in
    let lambda_l2 = [Lambda.i1; Lambda.i2; Lambda.i3;] in
    try
      List.iter (fun l -> print_endline (string_of_bool (Hw5.Problem1.check l))) lambda_l1;
      List.iter (fun l -> print_endline (string_of_bool (Hw5.Problem1.check l))) lambda_l2
    with
      _ -> print_endline ("Problem1 Error")
  else if !src = "" then Arg.usage spec usage
  else 
    let file_channel = open_in !src in
    let lexbuf = Lexing.from_channel file_channel in
    let pgm = Parser.program Lexer.start lexbuf in
    if !print_code then (
      try
        print_endline "== 입력 프로그램 ==";
        Pp.PPKML.pp pgm
      with Lexer.LexicalError -> print_endline (!src ^ ": 문법 오류")
    ) else if !kml_test then (
      try
        Pp.PPKML.print_value (Hw5.Problem2.run pgm);
      with
        Hw5.Problem2.Error -> print_endline ("Problem2 Error")
    ) else if !trans_test then (
      try
        print_endline "\n== 변환된 프로그램 ==";
        Pp.PPNKML.pp (Hw5.Problem3.translate (Trans.translate pgm))
      with
        Hw5.Problem3.CannotTranslate -> print_endline ("Problem3 Error")
    ) else if !nameless_test then (
      try
        Pp.PPNKML.print_value (Hw5.Problem4.nl_run (Hw5.Problem3.translate (Trans.translate pgm)))
      with
        Hw5.Problem4.Error -> print_endline ("Problem4 Error")
    ) else ()

let _ = main ()
