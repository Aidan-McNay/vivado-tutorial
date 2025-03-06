# ========================================================================
# simulate_design.tcl
# ========================================================================
# A Tcl script to simulate our design from

# ------------------------------------------------------------------------
# Open the project if needed (when run in batch)
# ------------------------------------------------------------------------
# https://adaptivesupport.amd.com/s/question/0D52E00006iHl8gSAC/how-can-i-tell-if-a-project-is-already-open-in-a-tcl-script?language=en_US

if {[catch {current_project } result ]} {
  open_project ./vivado-walkthrough.xpr
}

# ------------------------------------------------------------------------
# Simulate the design
# ------------------------------------------------------------------------

launch_simulation