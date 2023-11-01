let insert_at el at list =
  let rec aux el at acc = function
    | [] -> if at >= 0 then List.rev (el :: acc) else List.rev acc
    | h :: t ->
        if at = 0 then aux el (at - 1) (h :: el :: acc) t
        else aux el (at - 1) (h :: acc) t
  in
  aux el at [] list
