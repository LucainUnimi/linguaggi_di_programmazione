let length l =
  let rec lenght count = function
    | [] -> count
    | h :: t -> lenght (count + 1) t
  in
  lenght 0 l
