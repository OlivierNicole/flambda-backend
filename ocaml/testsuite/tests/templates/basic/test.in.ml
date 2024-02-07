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

<TEST TREE HERE>
*)
