# ========================================================================
# set_constraints.tcl
# ========================================================================
# A Tcl script to set our design's constraints

# ------------------------------------------------------------------------
# Open the project if needed (when run in batch)
# ------------------------------------------------------------------------
# https://adaptivesupport.amd.com/s/question/0D52E00006iHl8gSAC/how-can-i-tell-if-a-project-is-already-open-in-a-tcl-script?language=en_US

if {[catch {current_project } result ]} {
  open_project ./vivado-walkthrough.xpr
}

# ------------------------------------------------------------------------
# Add our constraints file
# ------------------------------------------------------------------------

add_files -fileset constrs_1 ../scripts/constraints/walkthrough-constraints.xdc

# ------------------------------------------------------------------------
# Re-run synthesis
# ------------------------------------------------------------------------

source ../scripts/synthesis/synthesize_design.tcl