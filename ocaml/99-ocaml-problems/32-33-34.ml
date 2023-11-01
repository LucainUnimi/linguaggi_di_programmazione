let rec gdc a b = if b = 0 then a else gdc b (a mod b)
let coprime a b = gdc a b = 1

let phi n =
  let rec aux n acc m =
    match n with
    | 0 -> acc
    | _ -> (
        match coprime n m with
        | true -> aux (n - 1) (acc + 1) m
        | false -> aux (n - 1) acc m)
  in
  aux n 0 n
