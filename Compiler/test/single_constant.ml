open Program_types

let input = 
"const v0 = 0;"

let correct = [
    {
        inouts = [0l];
        operation = Load_integer {value = 0L};
    };
]

let test () = 
    let (ast, errors) = Compiler.string_to_flow_ast input in
    let prog = Compiler.flow_ast_to_inst_list ast false false true in
    Alcotest.(check (list Util.inst_testable)) "single_constant" correct prog 