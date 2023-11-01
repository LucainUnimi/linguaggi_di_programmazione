module type GraphADT = sig
  type node
  type graph
  type interdependency

  val empty : unit -> graph
end
