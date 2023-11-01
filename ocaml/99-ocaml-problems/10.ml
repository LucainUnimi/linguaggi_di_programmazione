let encode list =
  let rec aux count = function
    | [] -> []
    | h :: [] -> (count, h) :: []
    | h :: (b :: _ as t) ->
        if h = b then aux (count + 1) t else (count, h) :: aux 1 t
  in
  aux 1 list
