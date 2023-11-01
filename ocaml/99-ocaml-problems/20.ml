let remove_at n list =
  let rec aux n acc = function
    | [] -> List.rev acc
    | h :: t -> if n = 0 then aux (n - 1) acc t else aux (n - 1) (h :: acc) t
  in
  aux n [] list
