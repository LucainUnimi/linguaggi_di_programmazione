let alkaline_earth_metals = ("berylium", 4)::("magnesium", 12)::("calcium", 20)::("stroztium", 38)::("barium", 56)::("radium", 88)::[]

let ( -: ) a b = snd a - snd b

let max a b = 
  if ( ( -: ) a b ) > 0 then a else b

let heaviest l =
  List.fold_left max (List.hd l) (List.tl l)

let noble_gases = ("neon", 10)::("helium", 2)::("argon", 18)::("krypton", 36)::("xenon", 54)::("radon", 86)::[]

let sort l = List.sort (-:) l

let merge_list l1 l2 = List.merge ( -: ) (sort l1) (sort l2)

