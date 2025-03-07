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

reset_run synth_1 -prev_step

# ------------------------------------------------------------------------
# Run synthesis
# ------------------------------------------------------------------------

launch_runs synth_1 -jobs 4

# ------------------------------------------------------------------------
# Wait for synthesis to finish
# ------------------------------------------------------------------------

wait_on_run synth_1

# ------------------------------------------------------------------------
# Indicate that synthesis is done
# ------------------------------------------------------------------------
# Hacky fix - for some reason, Vivado thinks that synthesis needs to be
# re-run after completing from Tcl, so we explicitly tell it that it's
# good
#
# https://adaptivesupport.amd.com/s/question/0D52E00006hpko2SAA/vivado-warning-constraints-185210-no-constraints-selected-for-write?language=en_US

set_property needs_refresh false [get_runs synth_1]