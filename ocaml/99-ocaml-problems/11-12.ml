type 'a rle = One of 'a | Many of int * 'a

let encode list =
  let rec aux coutn acc = function
    | [] -> acc
    | h :: [] ->
        if coutn = 1 then aux 1 (One h :: acc) []
        else aux 1 (Many (coutn, h) :: acc) []
    | h :: (b :: _ as t) ->
        if h = b then aux (coutn + 1) acc t
        else if coutn = 1 then aux 1 (One h :: acc) t
        else aux 1 (Many (coutn, h) :: acc) t
  in
  List.rev (aux 1 [] list)

let decode list =
  let rec many n x list =
    if n = 1 then x :: list else many (n - 1) x (x :: list)
  in
  let rec aux acc = function
    | [] -> acc
    | One x :: t -> aux (x :: acc) t
    | Many (count, x) :: t -> aux (many count x acc) t
  in
  List.rev (aux [] list)
