Synthesizing Our Design
==========================================================================

Now that we have our top-level module, we can push it through synthesis!
This will generate the exact hardware resources that will be used to
represent our design

.. admonition:: RTL Elaboration
   :class: note

   In the Flow Manager, one step you'll see that I'm skipping over is
   RTL Elaboration. While this step isn't necessary to complete on
   its own (it will be run as part of synthesis), you may wish to
   explore it on your own, as it will generate a nice RTL block
   diagram of your design.

Synthesizing Our Design
--------------------------------------------------------------------------

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Synthesizing Our Design
          :class: important

          On the left-hand side, in **Flow Navigator**, under
          **Synthesis**, click **Run Synthesis**, then click
          **OK**.

          This may take a while, and will run in the background; if
          you look in the top-right corner, you will see a spinning
          wheel that gives some indication what is going on.

          After a minute, you will get a pop-up (hopefully) saying
          "Synthesis successfully completed" - if synthesis wasn't
          successful, you would've gotten errors in the **Messages**
          tab. Select "Open Synthesized Design", then click **OK**
          (the same as selecting it from the Flow Navigator).

          You may have some warnings pop up at this stage; you
          can ignore them for now, and click **OK**. Leave this
          window open, as we'll need it for adding constraints.

    .. group-tab:: TCL

       .. admonition:: Synthesizing Design
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``synthesize_design.tcl`` script

          .. code-block:: bash

             vivado -mode batch -source ../scripts/synthesis/synthesize_design.tcl

          Check the output logs for the line
          ``synth_design completed successfully``, and you should be good!

Viewing Reports
--------------------------------------------------------------------------

After our design is synthesized, we can gain some information about its
resource utilization. While this isn't the most accurate (it will be
more accurate after future steps), it can give us a good sense of what
Vivado expects our design to use.

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Viewing Synthesis Reports
          :class: important

          Open the **Reports** window; it may already be open as a
          tab on the bottom, or you can open it with **Window -> Reports**

          Under **Synthesis**, you should now have a tab titled
          **Synth Design**, which contains the synthesis results from
          our design. The ``synthesis_report`` is simply the raw message
          output from Vivado, but the ``report_utilization`` will
          detail the utilization of our design - double-click it to open.
          Browse through the report, and see if you can find some
          interesting information about how many resources our design
          uses.

          Additionally under **Synthesis** is a tab titled
          **Out-Of-Context Module Runs**; this is where Vivado
          places any runs that were completed separately, but overall
          as part of synthesis. Examining this, you should find a
          section for our ``CLK_gen`` block design; this should
          contain three synthesis reports, one for each of our IP
          blocks that we used.

    .. group-tab:: TCL

       .. admonition:: Viewing Synthesis Reports
          :class: important

          In the project directory, all of the outputs of flow steps
          are under ``vivado-walkthrough.runs``. Here, you should now
          find a ``synth_1`` directory containing a file titled
          ``top_utilization_synth.rpt``; this is the utilization
          report, which you can browse the same. Additionally in
          ``vivado-walkthrough.runs`` are directories for each of
          the out-of-context IP block synthesis runs.