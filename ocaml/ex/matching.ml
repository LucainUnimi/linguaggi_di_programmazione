let x =
  match not true with
  | true -> "nope"
  | false -> "yep";;

let y = 
  match 42 with
  | fooo -> fooo;;


let z =
  match "foo" with
  | "bar" -> 1
  | _ -> 0;;

let a = 
  match [] with
  | [] -> "empty"
  | _ -> "nont empty";;

let b =
  match ["taylor"; "swift"] with
  | [] -> "folklore"
  | h :: t -> h;;

let fst3 t =
  match t with
  | (a, b, c) -> a;;
