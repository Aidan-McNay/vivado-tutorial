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
          ``impl_1 finished``, and you should be good!

Viewing Reports
--------------------------------------------------------------------------

Compared to synthesis, we have *many* more reports we can view now about
our design!

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Viewing Implementation Reports
          :class: important

          Open the **Reports** window; it may already be open as a
          tab on the bottom, or you can open it with **Window -> Reports**

          Under **Implementation**, you should now have a tab titled
          ``impl_1``, which contains the implementation results from
          our design. Here, you can view various metrics (such as
          utilization, power, and slack).

          As an exercise, find the following metrics in the reports:

          * The number of LUTs used after placing the design
            (``impl_1_place_report_utilization_0``, under **Place Design**)
             
             * Compare to your synthesis results!

          * The total negative slack (TNS) of all paths after routing
            the design - this should be 0 to have timing be met
            (``impl_1_route_report_timing_summary_0``, under **Route Design**)

          * The power usage after routing (``impl_1_route_report_power_0``,
            under **Route Design**)

             * Which component takes the most power? (``PS7`` is the on-board
               processing system with the Cortex-A9 processor)

    .. group-tab:: TCL

       .. admonition:: Viewing Implementation Reports
          :class: important

          In the project directory, all of the outputs of flow steps
          are under ``vivado-walkthrough.runs``. Here, you should now
          find a ``impl_1`` directory with all of the reports. Using
          the ``top_utilization_placed.rpt``, ``top_timing_summary_routed.rpt``,
          and ``top_power_routed.rpt``, answer the questions from the GUI
          section