let is_prime n =
  let n = abs n in
  let cap = float_of_int n |> sqrt in
  let rec aux n d =
    if n mod d = 0 then false
    else if float_of_int d >= cap then true
    else aux n (d + 1)
  in
  aux n 2

let is_prime_return_n n =
  let n = abs n in
  let cap = float_of_int n |> sqrt in
  let rec aux n d =
    if n mod d = 0 then None
    else if float_of_int d >= cap then Some n
    else aux n (d + 1)
  in
  aux n 2

let rec next_prime n =
  let n = n + 1 in
  if is_prime n then n else next_prime n
