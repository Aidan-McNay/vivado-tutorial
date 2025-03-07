# ========================================================================
# synthesize_design.tcl
# ========================================================================
# A Tcl script to synthesize our design

# ------------------------------------------------------------------------
# Open the project if needed (when run in batch)
# ------------------------------------------------------------------------
# https://adaptivesupport.amd.com/s/question/0D52E00006iHl8gSAC/how-can-i-tell-if-a-project-is-already-open-in-a-tcl-script?language=en_US

if {[catch {current_project } result ]} {
  open_project ./vivado-walkthrough.xpr
}

# ------------------------------------------------------------------------
# Reset synthesis (if needed)
# ------------------------------------------------------------------------

reset_run synth_1 -quiet

# ------------------------------------------------------------------------
# Run synthesis
# ------------------------------------------------------------------------

launch_runs synth_1 -jobs 4

# ------------------------------------------------------------------------
# Wait for synthesis to finish
# ------------------------------------------------------------------------

wait_on_run synth_1