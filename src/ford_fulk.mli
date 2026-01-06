open Graph
open Tools

(*Find a path in a graph with the DFS algorithm, giving the starting node and the destination node*)
val find_path : 'a graph -> id -> id -> id list

(*Takes a list of id and return all the arcs that the algorithm took to go to the dest node*)
val find_arc_path : 'a graph -> id list -> 'a arc list

(*Returns the minimum capacity of an arc path*)
val find_min_capacity : 'a arc list -> int

(*Returns the maximum flows value of a graph applying the Ford-Fulkerson algorithm*)
val algo_ford : 'a graph -> id -> id -> 'a
