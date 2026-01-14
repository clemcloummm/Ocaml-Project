(* Yes, we have to repeat open Graph. *)
open Graph


let clone_nodes gr = n_fold gr new_node empty_graph

let gmap gr f = e_fold gr (fun acu x -> new_arc acu ({src = x.src ; tgt = x.tgt ; lbl = f x.lbl})) (clone_nodes gr)



let add_arc gr id1 id2 (n : int) = 
    let arc = find_arc gr id1 id2 in
    match arc with
      |None -> new_arc gr {src = id1 ; tgt = id2 ; lbl = n};
      |Some x-> new_arc gr {x with lbl = x.lbl + n};

