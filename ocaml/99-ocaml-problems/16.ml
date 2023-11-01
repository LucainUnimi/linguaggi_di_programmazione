let drop list n =
  let rec aux acc n = function
    | [] -> List.rev acc
    | h :: t -> if n = 1 then aux acc (n - 1) t else aux (h :: acc) (n - 1) t
  in
  aux [] n list
