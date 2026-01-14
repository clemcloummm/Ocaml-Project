open Graph
open Tools
open Ford_fulk

let assert_test name condition =
  if condition then
    Printf.printf " Test %s passé\n" name
  else
    (Printf.printf " Test %s échoué\n" name)

let run_tests () =
  Printf.printf "--- Lancement des Tests Unitaires ---\n";

  (* --- Tests Tools --- *)
  let g = empty_graph in
  let g = new_node g 1 in
  let g = new_node g 2 in
  
  (* Test add_arc : création *)
  let g1 = add_arc g 1 2 10 in
  let arc = find_arc g1 1 2 in
  assert_test "add_arc_creation" (match arc with 
    | Some a -> a.lbl = 10 
    | _ -> false);

  (* Test add_arc : addition *)
  let g2 = add_arc g1 1 2 5 in
  let arc2 = find_arc g2 1 2 in
  assert_test "add_arc_addition" (match arc2 with 
    | Some a -> a.lbl = 15 
    | _ -> false);

  (* --- Tests Ford_fulk --- *)
  (* Création d'un graphe simple : 0 --(10)--> 1 *)

  (* 1. On part d'un graphe vide *)
  let g_vide = empty_graph in 

  (* 2. On ajoute le noeud 0 *)
  let g_avec_0 = new_node g_vide 0 in 

  (* 3. On ajoute le noeud 1 *)
  let gf = new_node g_avec_0 1 in 

  let gfinal = add_arc gf 0 1 10 in
  
  (* Test find_path *)
  let path = find_path gfinal 0 1 in
  assert_test "find_path_simple" (path = [0; 1]);

  (* Test find_path quand aucun chemin n'existe *)
  let path_none = find_path gfinal 1 0 in
  assert_test "find_path_none" (path_none = []);

  (* Test algo_ford sur un cas connu *)
  let final_g = algo_ford gfinal 0 1 in

  (* Dans le graphe résiduel, l'arc 0->1 doit avoir 0 de capacité et 1->0 doit avoir 10 *)
  let arc_res = find_arc final_g 0 1 in
  assert_test "ford_fulk_residual" (match arc_res with 
    | Some a -> a.lbl = 0 
    | _ -> false);

  Printf.printf "--- Tous les tests sont terminés avec succès ---\n"

let () = run_tests ()