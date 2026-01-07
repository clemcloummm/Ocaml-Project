open Graph

(*Find a path in a graph with the DFS algorithm, giving the starting node and the destination node*)
val find_path : id graph -> id -> id -> id list

(*Takes a list of id and return all the arcs that the algorithm took to go to the dest node*)
val find_arc_path : id graph -> id list -> id arc list

(*Returns the minimum capacity of an arc path*)
val find_min_capacity : id arc list -> int

(*Creates the correposnding arcs in the flow graph *)
val add_flow : id graph -> 'a arc list -> id -> id graph

(*Returns the maximum flows value of a graph applying the Ford-Fulkerson algorithm*)
val algo_ford : id graph -> id -> id -> id graph

(*Returns the graphs with the maximum flow on each arc*)
val graph_fin : id graph -> id graph -> string graph