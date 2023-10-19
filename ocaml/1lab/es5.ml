let string_to_list s =
  let rec string_to_list s idx acc =
    if idx < String.length s then string_to_list s (idx + 1) (s.[idx] :: acc)
    else List.rev acc
  in
  string_to_list s 0 []

let char_list_to_string c =
  let rec char_list_to_string c acc =
    match c with
    | [] -> acc
    | h :: t -> char_list_to_string t (acc ^ Char.escaped h)
  in
  char_list_to_string c ""

let ( - ) s1 s2 =
  let lists1 = string_to_list s1 in
  let lists2 = string_to_list s2 in
  let rec substarct lists1 lists2 res =
    match lists2 with
    | [] -> char_list_to_string res
    | h :: t ->
        substarct lists1 t (List.filter (fun x -> not (Char.equal h x)) res)
  in
  substarct lists1 lists2 lists1

let is_palindrome s1 s2 =
  string_to_list s2 |> List.rev |> char_list_to_string |> String.equal s1

let sort s =
  let n = String.length s in
  let a = Array.init n (fun i -> s.[i]) in
  Array.sort Char.compare a;
  String.init n (fun i -> a.(i))

let is_anagram w1 w2 = String.equal (sort w1) (sort w2)

let rec anagram word dictionary =
  match dictionary with
  | [] -> false
  | h :: t -> if is_anagram word h then true else anagram word t
