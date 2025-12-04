open Graph
open Tools

(*Find a path in a graph with the BFS algorithm, giving the starting node and the destination node*)
val find_path : 'a graph -> id -> id -> 'a arc list

(*Returns the max flow of an arc list*)
val max_flot : 'a arc list -> 'a

(*Returns the maximum flows value of a graph applying the Ford-Fulkerson algorithm*)
val algo_ford : 'a graph -> id -> id -> 'a