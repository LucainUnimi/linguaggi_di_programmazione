let rec at idx = function
  | [] -> None
  | h :: t when idx == 1 -> Some h
  | h :: t -> at (idx - 1) t
