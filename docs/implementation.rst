Implementing Our Design
==========================================================================

The second part of the flow is **implementation**; this is where our
design is placed and routed on the FPGA. Assuming the rest of the process
went well, so too should implementation; however, for large designs,
this process will take a *while*.

Running Implementation
--------------------------------------------------------------------------

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Running Implementation
          :class: important

          On the left-hand side, in **Flow Navigator**, under
          **Implementation**, click **Run Implementation**, then click
          **OK**.

          This may take a while, and will run in the background; if
          you look in the top-right corner, you will see a spinning
          wheel that gives some indication what is going on.

    .. group-tab:: TCL

       .. admonition:: Running Implementation
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``impl_design.tcl`` script

          .. code-block:: bash

             vivado -mode batch -source ../scripts/implementation/impl_design.tcl

          Check the output logs for the line
          ``synth_design completed successfully``, and you should be good!

Viewing Reports
--------------------------------------------------------------------------

Compared to synthesis, we have *many* more reports we can view now about
our design!

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Viewing Implementation Reports
          :class: important

          This is a task to be run in Vivado's Graphical User
          Interface (GUI)!

    .. group-tab:: TCL

       .. admonition:: Viewing Implementation Reports
          :class: important

          In the project directory, all of the outputs of flow steps
          are under ``vivado-walkthrough.runs``. Here, you should now
          find a ``impl_1`` directory