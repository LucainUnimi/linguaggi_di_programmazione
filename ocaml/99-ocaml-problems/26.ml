let rec extract n list =
  if n <= 0 then [ [] ]
  else
    match list with
    | [] -> []
    | h :: t ->
        let with_h = List.map (fun x -> h :: x) (extract (n - 1) t) in
        let without_h = extract n t in
        with_h @ without_h
