let rec last = function [ i ] -> Some i | h :: t -> last t | [] -> None
