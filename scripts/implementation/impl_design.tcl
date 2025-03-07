# ========================================================================
# impl_design.tcl
# ========================================================================
# A Tcl script to implement our design

# ------------------------------------------------------------------------
# Open the project if needed (when run in batch)
# ------------------------------------------------------------------------
# https://adaptivesupport.amd.com/s/question/0D52E00006iHl8gSAC/how-can-i-tell-if-a-project-is-already-open-in-a-tcl-script?language=en_US

if {[catch {current_project } result ]} {
  open_project ./vivado-walkthrough.xpr
}

# ------------------------------------------------------------------------
# Reset implementation (if needed)
# ------------------------------------------------------------------------

reset_run impl_1

# ------------------------------------------------------------------------
# Run implementation
# ------------------------------------------------------------------------

launch_runs impl_1 -jobs 4

# ------------------------------------------------------------------------
# Wait for implementation to finish
# ------------------------------------------------------------------------

wait_on_run impl_1