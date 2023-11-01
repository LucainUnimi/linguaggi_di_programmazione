let pack list =
  let rec aux sub acc = function
    | [] -> []
    | h :: [] -> (h :: sub) :: acc
    | h :: (b :: _ as t) ->
        if h = b then aux (h :: sub) acc t else aux [] ((h :: sub) :: acc) t
  in
  List.rev (aux [] [] list)
