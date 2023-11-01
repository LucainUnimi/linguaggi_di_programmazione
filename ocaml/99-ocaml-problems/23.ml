let rand_select list n =
  let rec extract at acc = function
    | [] -> raise Not_found
    | h :: t -> if at = 0 then (h, acc @ t) else extract (at - 1) (h :: acc) t
  in
  let rec aux n acc list =
    if n = 0 then acc
    else
      let picked, rest = extract (Random.int (List.length list)) [] list in
      aux (n - 1) (picked :: acc) rest
  in
  aux n [] list
