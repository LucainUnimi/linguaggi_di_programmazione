module Matrix = 
  struct
  type matrix = int list list

  let zeroes n m =
    List.init n (fun x -> List.init m (fun x->0))
  
  let identity n =
    List.init n (fun x -> List.init n (fun y -> if y==x then 1 else 0))
    
  let init n =
    List.init n (fun x -> List.init n (fun y -> n*x +y +1))
  
  let rec transpose m =
    match m with
    | [] -> []
    | []::t -> transpose t
    | (h::t)::tl -> (h :: (List.map List.hd tl)) :: transpose (t :: List.map List.tl tl) 

  let ( +: ) m1 m2 =
    List.map2 (fun r1 r2 -> List.map2 (fun e1 e2 -> e1 + e2 ) r1 r2) m1 m2

  let prod_list r1 r2 =
    List.map2 ( * ) r1 r2

  let rec sum_list = function
    | []    -> 0
    | h::t  -> sum_list t + h
  
  let dotprod r1 r2 =
    List.map2 ( * ) r1 r2 |> sum_list
  
  let ( *: ) m1 m2 =
    List.map (fun r1 -> (List.map (fun r2 -> dotprod r1 r2) (transpose m2) )) m1

  end;;
