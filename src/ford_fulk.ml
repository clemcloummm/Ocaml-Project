open Graph

let find_path gr src dest =
  let rec dfs node path =
    if node = dest then List.rev path
    else
      let voisins_arcs = out_arcs gr node in
      let voisins = List.map (fun x -> x.tgt) voisins_arcs in
      let voisinsNotVisited = List.filter (fun x -> not (List.mem x path)) voisins in
      iterVoisins voisinsNotVisited path

  and iterVoisins vnv path =
    match vnv with
    | [] -> []
    | x :: rest ->
      let res = dfs x (x :: path) in
      if res = [] then iterVoisins rest path else res
  in
  dfs src [src]

  let find_arc_path gr nodePath =
    let rec aux acu nodePath =
      match nodePath with 
        |[] -> acu
        |[_] -> acu
        |x :: y :: rest -> 
          begin match find_arc gr x y with 
            |Some n ->aux (n::acu) (y :: rest) 
            |None -> assert false
          end 
    in
  aux [] nodePath