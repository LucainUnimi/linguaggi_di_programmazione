let split list n =
  let rec aux acc n = function
    | [] -> (List.rev acc, [])
    | h :: t ->
        if n = 1 then (List.rev (h :: acc), t) else aux (h :: acc) (n - 1) t
  in
  aux [] n list

let rotate list n =
  let len = List.length list in
  let n = if len = 0 then 0 else ((n mod len) + len) mod len in
  if n = 0 then list
  else
    let a, b = split list n in
    b @ a
