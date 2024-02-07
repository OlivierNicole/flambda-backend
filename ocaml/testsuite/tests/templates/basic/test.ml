(* If this is [test.ml], instead change [test.in.ml] and/or [gen_test.ml] and
   re-run [gen_test.ml]. *)

(* TEST

readonly_files = "\
  bad_arg_impl.ml bad_arg_impl.reference \
  bad_arg_intf.mli bad_arg_intf.reference \
  bad_ref_direct.ml bad_ref_direct.reference \
  bad_ref_indirect.ml bad_ref_indirect.reference \
  monoid.mli \
  monoid_utils.ml monoid_utils.mli monoid_utils_as_program.reference \
  string_monoid.ml string_monoid.mli \
  test_direct_access.ml test_direct_access.reference \
"

* setup-ocamlc.byte-build-env
** ocamlc.byte
flags = "-as-parameter"
module = "monoid.mli"
*** ocamlc.byte
flags = ""
module = "bad_ref_direct.ml"
compiler_output = "bad_ref_direct.output"
ocamlc_byte_exit_status = "2"
**** check-ocamlc.byte-output
compiler_reference = "bad_ref_direct.reference"
*** ocamlc.byte
flags = "-as-argument-for Monoid"
module = "bad_arg_impl.ml"
compiler_output = "bad_arg_impl.output"
ocamlc_byte_exit_status = "2"
**** check-ocamlc.byte-output
compiler_reference = "bad_arg_impl.reference"
*** ocamlc.byte
flags = "-as-argument-for Monoid"
module = "bad_arg_intf.mli"
compiler_output = "bad_arg_intf.output"
ocamlc_byte_exit_status = "2"
**** check-ocamlc.byte-output
compiler_reference = "bad_arg_intf.reference"
*** copy
src = "string_monoid.ml"
dst = "string_monoid_no_mli.ml"
**** ocamlc.byte
flags = "-as-argument-for Monoid"
module = "string_monoid_no_mli.ml string_monoid.mli string_monoid.ml"
***** ocamlc.byte
flags = ""
module = "test_direct_access.ml"
****** ocamlc.byte
flags = ""
program = "${test_build_directory}/test_direct_access.bc"
module = ""
all_modules = "\
   string_monoid.cmo \
   string_monoid_no_mli.cmo \
   test_direct_access.cmo \
"
******* run
output = "test_direct_access.output"
exit_status = "0"
******** check-program-output
reference = "test_direct_access.reference"
*** ocamlc.byte
flags = "-parameter Monoid"
module = "monoid_utils.mli monoid_utils.ml"
**** ocamlc.byte
flags = ""
module = "bad_ref_indirect.ml"
compiler_output = "bad_ref_indirect.output"
ocamlc_byte_exit_status = "2"
***** check-ocamlc.byte-output
compiler_reference = "bad_ref_indirect.reference"
**** ocamlc.byte
program = "${test_build_directory}/monoid_utils_as_program.bc"
module = ""
all_modules = "\
   monoid_utils.cmo \
"
***** run
output = "monoid_utils_as_program.output"
exit_status = "2"
****** check-program-output
reference = "monoid_utils_as_program.reference"
* setup-ocamlopt.byte-build-env
** ocamlopt.byte
flags = "-as-parameter"
module = "monoid.mli"
*** ocamlopt.byte
flags = ""
module = "bad_ref_direct.ml"
compiler_output = "bad_ref_direct.output"
ocamlopt_byte_exit_status = "2"
**** check-ocamlopt.byte-output
compiler_reference = "bad_ref_direct.reference"
*** ocamlopt.byte
flags = "-as-argument-for Monoid"
module = "bad_arg_impl.ml"
compiler_output = "bad_arg_impl.output"
ocamlopt_byte_exit_status = "2"
**** check-ocamlopt.byte-output
compiler_reference = "bad_arg_impl.reference"
*** ocamlopt.byte
flags = "-as-argument-for Monoid"
module = "bad_arg_intf.mli"
compiler_output = "bad_arg_intf.output"
ocamlopt_byte_exit_status = "2"
**** check-ocamlopt.byte-output
compiler_reference = "bad_arg_intf.reference"
*** copy
src = "string_monoid.ml"
dst = "string_monoid_no_mli.ml"
**** ocamlopt.byte
flags = "-as-argument-for Monoid"
module = "string_monoid_no_mli.ml string_monoid.mli string_monoid.ml"
***** ocamlopt.byte
flags = ""
module = "test_direct_access.ml"
****** ocamlopt.byte
flags = ""
program = "${test_build_directory}/test_direct_access.exe"
module = ""
all_modules = "\
   string_monoid.cmx \
   string_monoid_no_mli.cmx \
   test_direct_access.cmx \
"
******* run
output = "test_direct_access.output"
exit_status = "0"
******** check-program-output
reference = "test_direct_access.reference"
*** ocamlopt.byte
flags = "-parameter Monoid"
module = "monoid_utils.mli monoid_utils.ml"
**** ocamlopt.byte
flags = ""
module = "bad_ref_indirect.ml"
compiler_output = "bad_ref_indirect.output"
ocamlopt_byte_exit_status = "2"
***** check-ocamlopt.byte-output
compiler_reference = "bad_ref_indirect.reference"
**** ocamlopt.byte
program = "${test_build_directory}/monoid_utils_as_program.exe"
module = ""
all_modules = "\
   monoid_utils.cmx \
"
***** run
output = "monoid_utils_as_program.output"
exit_status = "2"
****** check-program-output
reference = "monoid_utils_as_program.reference"
*)
