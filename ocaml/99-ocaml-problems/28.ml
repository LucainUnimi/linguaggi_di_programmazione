let length_sort list =
  List.sort (fun a b -> compare (List.length a) (List.length b)) list

let frequency_sort list =
  let freq a list =
    (List.filter (fun b -> List.length b = List.length a) list |> List.length)
    / List.length list
  in
  List.sort (fun a b -> compare (freq b list) (freq a list)) list
