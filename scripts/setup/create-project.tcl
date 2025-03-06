# ========================================================================
# create-project.tcl
# ========================================================================
# A Tcl script to create a project for the Zybo Z7-10

# ------------------------------------------------------------------------
# Set the location to install boards (same as Vivado's default for 2019.2)
# ------------------------------------------------------------------------

set vivado_version [version -short]
set_param board.repoPaths "$::env(HOME)/.Xilinx/Vivado/${vivado_version}/xhub/board_store"
puts [get_param board.repoPaths]

# ------------------------------------------------------------------------
# Refresh the board catalog, just in case it wasn't installed already
# ------------------------------------------------------------------------

xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]
xhub::install [xhub::get_xitems -of_objects [xhub::get_xstores xilinx_board_store]]
xhub::update [xhub::get_xitems -of_objects [xhub::get_xstores xilinx_board_store]]

# ------------------------------------------------------------------------
# Create the project with our part
# ------------------------------------------------------------------------

create_project vivado-walkthrough . -part xc7z010clg400-1

# ------------------------------------------------------------------------
# Identify the exact board (not just the part)
# ------------------------------------------------------------------------

set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]

# ------------------------------------------------------------------------
# Open the GUI once done (just to see what's happened)
# ------------------------------------------------------------------------

start_gui