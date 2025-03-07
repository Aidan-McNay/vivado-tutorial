# ========================================================================
# gen_bitstream.tcl
# ========================================================================
# A Tcl script to generate our bitstream

# ------------------------------------------------------------------------
# Open the project if needed (when run in batch)
# ------------------------------------------------------------------------
# https://adaptivesupport.amd.com/s/question/0D52E00006iHl8gSAC/how-can-i-tell-if-a-project-is-already-open-in-a-tcl-script?language=en_US

if {[catch {current_project } result ]} {
  open_project ./vivado-walkthrough.xpr
}

# ------------------------------------------------------------------------
# Generate the bitstream
# ------------------------------------------------------------------------

launch_runs impl_1 -to_step write_bitstream -jobs 4