open Gfile
open Tools
open Ford_fulk

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in

  (*let wo_arc = clone_nodes graph in*)
  
  let new_graph = gmap graph (fun x -> (int_of_string x)) in
  
  (*let new_arc = add_arc new_graph 1 4 50 in

  let new_arc = gmap new_arc string_of_int in
  
  let nodePath = find_path new_graph 0 5 in

  let arcPath = find_arc_path new_graph nodePath in*)
  let test = algo_ford new_graph 0 12 in

  let new_graph2 = gmap test (fun x -> (string_of_int x)) in

  (* Rewrite the graph that has been read. *)
  (*let () = write_file outfile new_graph2 in*)
  let () = export outfile new_graph2 in
  
  ()

