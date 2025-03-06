# ========================================================================
# create-project.tcl
# ========================================================================
# A Tcl script to create a project for the Zybo Z7-10
#
# We assume that Vivado already has our board repositories updated

# Create the project with our part
create_project vivado-walkthrough . -part xc7z010clg400-1

# Identify the exact board (not just the part)
set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]