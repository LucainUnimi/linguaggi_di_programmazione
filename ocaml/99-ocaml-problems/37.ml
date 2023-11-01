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
