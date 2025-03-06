# ========================================================================
# add_sim_sources.tcl
# ========================================================================
# A Tcl script to add our testing/simulation sources

# ------------------------------------------------------------------------
# Open the project if needed (when run in batch)
# ------------------------------------------------------------------------
# https://adaptivesupport.amd.com/s/question/0D52E00006iHl8gSAC/how-can-i-tell-if-a-project-is-already-open-in-a-tcl-script?language=en_US

if {[catch {current_project } result ]} {
  open_project ./vivado-walkthrough.xpr
}

# ------------------------------------------------------------------------
# Add the file
# ------------------------------------------------------------------------

add_files -fileset sim_1 -norecurse ../test/gray_code_test.sv

# ------------------------------------------------------------------------
# Explicitly set the file type (not needed for .sv files)
# ------------------------------------------------------------------------

set_property FILE_TYPE SystemVerilog [get_files ../test/gray_code_test.sv]