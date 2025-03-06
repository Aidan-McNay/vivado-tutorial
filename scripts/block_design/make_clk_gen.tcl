# ========================================================================
# make_clk_gen.tcl
# ========================================================================
# A Tcl script to make our clk_gen block design

# ------------------------------------------------------------------------
# Open the project if needed (when run in batch)
# ------------------------------------------------------------------------
# https://adaptivesupport.amd.com/s/question/0D52E00006iHl8gSAC/how-can-i-tell-if-a-project-is-already-open-in-a-tcl-script?language=en_US

if {[catch {current_project } result ]} {
  open_project ./vivado-walkthrough.xpr
}

# ------------------------------------------------------------------------
# Source the block design Tcl script
# ------------------------------------------------------------------------
# Generated with File -> Export -> Export Block Diagram

source ../scripts/block_design/CLK_gen.tcl