module Taylor : sig
  val sin : float -> int -> float
  val cos : float -> int -> float
end = struct
  let rec factorial = function 0 -> 1 | 1 -> 1 | n -> n * factorial (n - 1)

  let sin x n =
    let rec sin x n acc sign =
      match n with
      | 0 -> acc
      | _ ->
          let term =
            sign
            *. (x ** float_of_int ((2 * n) + 1))
            /. float_of_int (factorial ((2 * n) + 1))
          in
          sin x (n - 1) (acc +. term) (-1. *. sign)
    in
    sin x n 0. 1.

  let cos x n =
    let rec cos x n acc sign =
      match n with
      | 0 -> acc
      | _ ->
          cos x (n - 1)
            (acc
            *. (sign
               *. (x ** float_of_int (2 * n))
               /. float_of_int (factorial 2 * n)))
            (-.sign)
    in
    cos x n 0. 1.
end
