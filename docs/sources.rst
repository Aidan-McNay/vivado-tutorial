Adding Sources
==========================================================================

Once we have a project, we can add our project sources to it!

Design Sources
--------------------------------------------------------------------------

The first thing we'll want to do is add **design sources**; these are the
files that describe the actual hardware that we want our FPGA to emulate

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Adding a Design Source
          :class: important

          * Navigate to **File -> Add Sources**
          * Make sure **Add or create design sources** is selected,
            then click **Next**
          * Click **Add Files**, then find the source file
            ``src/gray_code.sv`` in the tutorial repository.
            Click **OK**
          * Click **Finish**

    .. group-tab:: TCL

       .. admonition:: Adding a Design Source
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``add_design_sources.tcl`` script

          .. code-block:: bash

             % vivado -mode batch -source ../scripts/sources/add_design_sources.tcl

In the **Sources** window, under "Design Sources", you should now see the
``GrayCode`` module found from the ``gray_code.sv`` file.

* From the ``.sv`` extension, Vivado was able to figure out that the file
  was a SystemVerilog file. However, many designers choose to still use
  the ``.v`` extension, which would cause it to be incorrectly interpreted
  as base Verilog. The language used to interpret a file is a *property* of
  the source; to change it, click on the source file in the **Sources**
  window, then in the **Properties** window (under the *Properties* tab),
  change the ``FILE_TYPE`` to ``SystemVerilog``. Our Tcl script does this
  automatically
* If Vivado is unable to parse your file, it will show up in a separate
  sub-category titled "Syntax Error Files" in the **Sources** window.
  The offending section will be underlined in red, and you can also find
  more details in the **Messages** window.

Testing/Simulation Sources
--------------------------------------------------------------------------

In addition to our design files, we may also want to add *simulation*
sources; these are files that are only used to simulate our design, and
won't end up in the final hardware.

The only difference between these steps under the hood is the "fileset"
we add them to. By default, Vivado stores all of the simulation sources
in a fileset titled ``sim_1``

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Adding a Simulation Source
          :class: important

          * Navigate to **File -> Add Sources**
          * Make sure **Add or create simulation sources** is selected,
            then click **Next**
          * Note that under **Specify simulation set**, we currently have
            ``sim_1``. This is the default simulation fileset, and is
            good for our purposes.
          * Click **Add Files**, then find the source file
            ``test/gray_code_test.sv`` in the tutorial repository.
            Click **OK**
          * Click **Finish**

    .. group-tab:: TCL

       .. admonition:: Adding a Simulation Source
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``add_sim_sources.tcl`` script

          .. code-block:: bash

             % vivado -mode batch -source ../scripts/sources/add_sim_sources.tcl

In the **Sources** window, under "Simulation Sources", you can see the
``sim_1`` fileset. In there, Vivado should now show the ``GrayCodeTest``
module, found in ``gray_code_test.sv``. This window also shows the
hierarchy; from the dropdown, we can see that ``GrayCodeTest``
instantiates the ``GrayCode`` module (which Vivado already knows about,
since we left "Include all design sources for simulation" checked when
adding ``gray_code.sv``)