open Graph

(*Find a path in a graph with the DFS algorithm, giving the starting node and the destination node*)
val find_path : id graph -> id -> id -> id list

(*Returns the maximum flows value of a graph applying the Ford-Fulkerson algorithm*)
val algo_ford : id graph -> id -> id -> id graph

(*Returns the graphs with the maximum flow on each arc*)
val graph_fin : id graph -> id graph -> string graph