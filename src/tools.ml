(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes gr = n_fold gr new_node empty_graph

let gmap gr f = e_fold gr (fun acu x -> new_arc acu ({src = x.src ; tgt = x.tgt ; lbl = f x.lbl})) (clone_nodes gr)


(* Replace _gr and _f by gr and f when you start writing the real function. *)

let add_arc _gr = assert false
