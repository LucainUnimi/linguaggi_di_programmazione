let is_prime n =
  let n = abs n in
  let cap = float_of_int n |> sqrt |> ( +. ) 1. in
  let rec aux n d =
    if n mod d = 0 then false
    else if float_of_int d >= cap then true
    else aux n (d + 1)
  in
  aux n 2

let rec next_prime n = if is_prime n then n else next_prime (n + 1)

let all_primes start stop =
  let rec aux start stop acc =
    if start > stop then List.rev acc
    else aux (next_prime (start + 1)) stop (start :: acc)
  in
  aux (next_prime start) stop []
