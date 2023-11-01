module Graph = struct
  type node = Individual of string | Organization of string

  type interdependency =
    | Friendship
    | Kinship
    | Financial_exchange
    | Dislike
    | Sexual_relationships
    | Relationships_beliefs
    | Knowledge
    | Prestige

  type graph = Graph of (node list * (node * node * interdependency) list)

  exception NoNodeMatch
  exception NoInterdependecyMatch

  let empty () = Graph ([], [])

  let newnode name situation =
    match situation with
    | "Individual" -> Individual name
    | "Organization" -> Organization name
    | _ -> raise NoNodeMatch

  let rec add_node_in_list ?(res : node list = []) node = function
    | ([] : node list) -> List.rev (node :: res)
    | h :: t when h == node -> List.rev_append (h :: res) t
    | h :: t -> add_node_in_list ~res:(h :: res) node t

  let add_node name situation =
    let node = newnode name situation in
    function
    | Graph ([], []) -> Graph ([ node ], [])
    | Graph (nodes, arcs) -> Graph (add_node_in_list node nodes, arcs)

  let rec is_in_list node = function
    | [] -> false
    | h :: t when h == node -> true
    | h :: t -> is_in_list node t

  let is_in node = function
    | Graph ([], _) -> false
    | Graph (nodes, _) -> is_in_list node nodes

  let string_to_interdependecy = function
    | "Friendship" -> Friendship
    | "Kinship" -> Kinship
    | "Financial_exchange" -> Financial_exchange
    | "Dislike" -> Dislike
    | "Sexual_relationships" -> Sexual_relationships
    | "Relationships_beliefs" -> Relationships_beliefs
    | "Knowledge" -> Knowledge
    | "Prestige" -> Prestige
    | _ -> raise NoInterdependecyMatch

  let newarcs (node1 : node) (node2 : node) (interdependency : string) =
    (node1, node2, string_to_interdependecy interdependency)

  let add_arcs_in_list node1 node2 interdependency l =
    newarcs node1 node2 interdependency :: l

  let add_arcs node1 node2 interdependency = function
    | Graph (nodes, arcs) ->
        Graph
          ( add_node_in_list node1 (add_node_in_list node2 nodes),
            add_arcs_in_list node1 node2 interdependency arcs )
end
