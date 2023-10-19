let file = "input.txt"

let read_whole_file filename =
  let ch = open_in_bin filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let read_file file = In_channel.with_open_bin file In_channel.input_all

let words all_words =
  String.split_on_char '\n' all_words
  |> String.concat " " |> String.split_on_char ' '

let pretty all_words =
  let w = words all_words in
  let rec prettier acc w =
    match w with
    | [] -> List.rev acc
    | h :: t ->
        if String.equal h "" then prettier acc t else prettier (h :: acc) t
  in
  prettier [] w

let lower_word word =
  let rec lower_word_aux idx acc word =
    if idx < String.length word then
      lower_word_aux (idx + 1)
        (acc ^ (Char.lowercase_ascii word.[idx] |> Char.escaped))
        word
    else acc
  in
  lower_word_aux 0 "" word

let rec to_lower = function [] -> [] | h :: t -> lower_word h :: to_lower t

let count w l =
  let rec count c w l =
    match l with
    | [] -> c
    | h :: t -> if String.equal h w then count (c + 1) w t else count c w t
  in
  count 0 w l

let count_all_word l =
  let rec count_all_word l acc =
    match l with
    | [] -> acc
    | h :: t ->
        let update_counter = (h, count h l) in
        let update_list = List.filter (fun x -> not (String.equal x h)) t in
        count_all_word update_list (update_counter :: acc)
  in
  count_all_word l []
