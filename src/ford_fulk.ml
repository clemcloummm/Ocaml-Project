open Graph
open Tools

let find_path gr src dest = 
  let rec bfs node path =
      if node = dest then List.rev path
      else 
        let voisins = out_arcs gr node in
        let voisins_not_visited = List.filter (fun x -> not (List.mem x path)) voisins in 
        ...

        and iter_voisins voisins_not_visited =
          match voisins_not_visited with
            |[] -> []
            |x :: rest -> if bfs x (x :: path) = [] then iter_voisins rest else 

        
            