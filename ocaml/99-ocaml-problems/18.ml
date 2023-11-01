let slice list i f =
  let rec aux i f p acc = function
    | [] -> List.rev acc
    | h :: t ->
        if p >= i && p <= f then aux i f (p + 1) (h :: acc) t
        else aux i f (p + 1) acc t
  in
  aux i f 0 [] list
