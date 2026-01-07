open Graph
open Tools

let find_path gr src dest =
  let rec dfs node path =
    if node = dest then List.rev path
    else
      let voisins_arcs = out_arcs gr node in
      let arcs_utilisables = List.filter (fun arc -> arc.lbl > 0) voisins_arcs in
      let voisins = List.map (fun x -> x.tgt) arcs_utilisables in
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

  let find_min_capacity arcPath =
    match arcPath with
      | [] -> 0
      | x :: rest -> List.fold_left (fun acc arc -> min acc arc.lbl) x.lbl rest

  let rec add_flow gr list_arc capa = 
    match list_arc with
      |[] -> gr
      |x :: rest -> let gr1 = add_arc gr x.src x.tgt (-capa) in 
      let gr2 = add_arc gr1 x.tgt x.src capa in
      add_flow gr2 rest capa

  let algo_ford gr src dest =
    let rec aux acu =
      let nodePath = find_path acu src dest in
      match nodePath with
        | [] -> acu 
        | path ->
          let arcPath = find_arc_path acu path in
          let minCapa = find_min_capacity arcPath in
          aux (add_flow acu arcPath minCapa)
  in
  aux gr

  let graph_fin gr =
    let gr_node = clone_nodes gr in
    let rec aux acu = 
      
