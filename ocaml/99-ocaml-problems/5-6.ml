let reverse l =
  let rec aux acc = function [] -> acc | h :: t -> aux (h :: acc) t in
  aux [] l

let is_palindrome l1 = l1 = List.rev l1
