Simulating Our Design
==========================================================================

Before pushing our design through the flow, we may want to test it to
verify its functionality.

Simulation Settings
--------------------------------------------------------------------------

Before we simulate our design, it is worth pointing out where to find
the settings for doing so, in case users wish to manipulate them.

From the GUI, navigate to **Flow -> Settings -> Simulation Settings**.
In the window that appears, you should find all of the settings for
simulating the design (as well as other steps of the flow, should you
ever want them). This can be helpful for configuring Vivado's simulator,
as well as further defining the simulation environment (such as any
preprocessor defines or changing the simulation length).

Verify that the "Top module name" is set to ``GrayCodeTest``.
Additionally, our ``gray_code_test.sv`` has the line
**`include gray_code.sv**; however, we haven't told Vivado where to find
that file. Even though the file is added as a source, Vivado doesn't
assume the location of our intended file. Under the **Compilation** tab,
click the three dots next to **Verilog options**. Under
**Verilog Include Files Search Path**, add the ``src`` directory of the
tutorial repo, click **OK** to close the options pop-up, then
**Apply**, **OK** to close the settings.

A few other notes:

* Vivado is able to find the correct modules without include statements,
  so future designs do not need them if the file with the module is added
  (though this one was left in as a demonstration)
* The include path update can also be done as a Tcl command; however,
  knowning all the settings and changing them is often an interactive
  one, and is best done in the GUI unless the changes are already known

Simulation
--------------------------------------------------------------------------

We should now be able to run our simulation to test our design!

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Running the Simulation
          :class: important

          On the left-hand side, from the Flow Navigator, under
          **Simulation**, click **Run Simulation -> Run Behavioral Simulation**

          This will execute for a bit (compiling and elaborating your
          design, then running the simulation), and finish by opening a
          simulation window. In it, the default tabs open are (left to
          right):

          * **Scope**: The current scope in the hierarchy that we're
            examining. Use the drop-down arrows to navigate
          * **Objects**: The signals within our current scope.

             * Double-clicking on a signal will show you the line in
               the file where it's declared
             * Right-click a signal to add it to the waveform

          * **Waveform** (often titled "Untitled 1" - you may need to
            switch tabs): A waveform showing how the signals in our
            design change over time

          Using the waveform, verify that the top-level signal
          ``dut_gray_count`` only changes one bit at a time (the
          hallmark of a gray code). Additionally, at the bottom,
          look in the **Tcl Console** to verify that our testbench
          displayed the text "All tests passed!"

    .. group-tab:: TCL

       .. admonition:: Example Task
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``simulate_design.tcl`` script

          .. code-block:: bash

             vivado -mode batch -source ../scripts/simulation/simulate_design.tcl