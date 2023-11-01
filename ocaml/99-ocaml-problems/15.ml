let replicate list n =
  let rec many c el list =
    if c = 1 then el :: list else many (c - 1) el (el :: list)
  in
  let rec aux acc n = function [] -> acc | h :: t -> aux (many n h acc) n t in
  List.rev (aux [] n list)
