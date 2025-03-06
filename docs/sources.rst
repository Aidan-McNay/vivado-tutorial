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
          * Make sure **Add or create design sources** is checked,
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

             vivado -mode batch -source ../scripts/sources/add_design_sources.tcl

In the **Sources** window, under "Design Sources", you should now see the
``GrayCode`` module found from the ``gray_code.sv`` file.

* From the ``.sv`` extension, Vivado was able to figure out that the file
  was a SystemVerilog file. However, many designers choose to still use
  the ``.v`` extension. This is a *property* of the source; to change it,
  click on the source file in the **Sources** window, then in the
  **Properties** window (under the *Properties* tab), change the
  ``FILE_TYPE`` to ``SystemVerilog``. Our Tcl script does this
  automatically
* If Vivado is unable to parse your file, it will show up in a separate
  sub-category titled "Syntax Error Files" in the **Sources** window.
  The offending section will be underlined in red, and you can also find
  more details in the **Messages** window.

Testing/Simulation Sources
--------------------------------------------------------------------------

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Example Task
          :class: important

          This is a task to be run in Vivado's Graphical User
          Interface (GUI)!

    .. group-tab:: TCL

       .. admonition:: Example Task
          :class: important

          This is a task to run actions with a Tcl script!