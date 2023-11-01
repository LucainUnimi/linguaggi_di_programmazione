type 'a node = One of 'a | Many of 'a node list

let flatten list =
  let rec flatten acc list =
    match list with
    | [] -> acc
    | One h :: t -> flatten (h :: acc) t
    | Many h :: t -> flatten (flatten acc h) t
  in
  List.rev (flatten [] list)
