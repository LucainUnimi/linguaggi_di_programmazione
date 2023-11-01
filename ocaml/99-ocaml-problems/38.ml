open Unix

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

let factors n =
  let rec aux d n =
    if n = 1 then []
    else if n mod d = 0 then
      match aux d (n / d) with
      | (h, n) :: t when h = d -> (h, n + 1) :: t
      | l -> (d, 1) :: l
    else aux (d + 1) n
  in
  aux 2 n

let phi_improved m =
  let rec aux acc = function
    | (h, n) :: t ->
        aux
          (float_of_int (h - 1)
          *. (float_of_int h ** float_of_int (n - 1))
          *. acc)
          t
    | _ -> acc
  in
  aux 1. (factors m)

let timeti f a =
  let t0 = Unix.gettimeofday () in
  ignore (f a);
  let t1 = Unix.gettimeofday () in
  t1 -. t0
