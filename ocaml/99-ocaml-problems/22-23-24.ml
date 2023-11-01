let range i f =
  if i < f then
    let rec aux i f acc =
      if i = f then List.rev (i :: acc) else aux (i + 1) f (i :: acc)
    in
    aux i f []
  else
    let rec aux i f acc =
      if i = f then List.rev (i :: acc) else aux (i - 1) f (i :: acc)
    in
    aux i f []

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

let lotto_select n r = rand_select (range 0 r) n
