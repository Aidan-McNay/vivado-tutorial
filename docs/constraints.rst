Adding Constraints
==========================================================================

We've told Vivado all about our design, but we haven't told it all
the information it needs to create it; it still needs to know where
all of the pins go, as well as any properties about the signals (such
as clock speed). In Vivado, these are known as *constraints*, and
tell Vivado more information about how your design should be
created.

.. admonition:: Board Dependency
   :class: warning

   Since this section deals with pin mappings and system-specific
   configurations, the exact constraints will vary by part/board.
   This is also where our *board* information (including what
   external connections are available) becomes important over just
   our *part* information

Constraint Types
--------------------------------------------------------------------------

There are three main types of constraints that we need to worry about:

* **Timing Constraints**: Telling Vivado information about timing, such
  as what frequencies different clocks run at
* **Physical Constraints**: This tells Vivado information about how to
  place signals, including:

  * *Netlist Constraints*: Information about how to process/optimize the
    netlist
  * *I/O Constraints*: Which I/O cells to connect to
  * *Placement Constraints*: Information about how to place the design
  * *Routing Constraints*: Information about how to route the design

* **Device Constraints**: Telling Vivado about device information, such
  as the operating voltage

Most of the time, you'll only need to work with the timing and I/O
constraints, although you can gain more control by viewing/editing the
others.

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Creating a Constraints File
          :class: important

          If you don't already have your synthesis view open, you can
          do so by clicking **Open Synthesized Design**, under
          **Synthesis** in the **Flow Navigator**.

          We'll also need to create a *constraints file*, with the
          extension ``.xdc`` (for Xilinx Design Constraints). You
          can make a new one by going to **File -> Add Sources**:

          * Select **Add or create constraints**, then click **Next**
          * Verify that the constraints set is ``constrs_1`` - this
            is the default fileset for constraints, similar to ``sim_1``
            for simulation sources.
          * Click **Create File**. Name the constraints
            **walkthrough-constraints**, and keep them local to the project.
            Click **OK**, then **Finish** to create the file.
         
          You should now see the file in the **Sources** window, in the
          ``constrs_1`` fileset under **Constraints**. Right-click on it,
          then select **Set as Target Constraint File**. This means that
          any constraints we later add will be added to this file.

       Now that we have our constraints file, we can start adding
       constraints!

       .. admonition:: Adding Timing Constraints
          :class: important

          On the left-hand side, in **Flow Navigator**, under
          **Synthesis** in **Open Synthesized Design**, click on
          **Constraints Wizard** (reload the design if necessary,
          from the new constraints):

          * On the Welcome page, click **Next**
          * In the "Primary Clocks" page, we shouldn't have to do
            anything! This is because the block design comes with
            its own constraints file, which identified and constrained
            the existings clocks. If it didn't, we'd have to identify
            the period of each clock signal. Click **Next**
          * Similarly, we don't generate any clocks in user space, so
            there's nothing to do in "Generated Clocks". Click **Next**.
            Do the same with "Forwarded Clocks".
          * We have no external loops, so we can skip past "External
            Feedback Delays" as well. Click **Next**.
          * "Input Delays" is where we might start describing delays;
            we can specify the delays of any input pins. Here,
            Vivado recommends adding a timing constraint to ``en``,
            and shows a waveform to indicate the possible parameters;
            however, since this is a free-running demo design, we'll
            ignore this. Uncheck the constraints for ``en`` and
            click **Next**.
          * Similarly, for "Output Delays", we'll ignore any delays
            on ``gray_count``; uncheck the constraint, then click **Next**
          * From here, there are a few more pages, such as clock
            domain crossings, but we won't edit any of them; click
            **Skip to Finish**, then **Finish**.

          Well, that was uneventful - but it does highlight how nice
          it is that block designs take care of some of the constraints
          for us!

       In addition to timing constraints, we'll also need to specify our
       I/O connections:

       .. admonition:: Adding I/O Constraints
          :class: important

          Open the **I/O Ports** window by going to
          **Window -> I/O Ports**. This will open up a window to select
          which I/O pins to connect to.

          Here, Vivado should identify that there are five output
          ports that need to be connected - our ``gray_count``
          outputs and ``en``. Most of the defaults here should be fine,
          but if you wanted, you could configure a few
          parameters relating to the I/O cell used.

          Click the drop-down next to ``gray_count`` to view each
          individual port. These should have a drop-down under
          **Package Pin** that allows you to select which pin to
          connect to. These names aren't very informative; to
          know what they actually connect to, you can look at
          the `user manual <https://digilent.com/reference/_media/reference/programmable-logic/zybo-z7/zybo-z7_rm.pdf?srsltid=AfmBOoo-inx2ykPdtVIgnq10KIrDVb9gS4hhQT7o08fEdqYPJCa3HzRS>`_,
          or Digilent has provided an `example constraints file <https://github.com/Digilent/digilent-xdc/blob/master/Zybo-Z7-Master.xdc>`_
          that identifies what each pin connects to.

          We'll be connecting the gray count to the four
          on-board LEDs; accordingly, connect:

          * ``gray_count[3]`` to pin D18
          * ``gray_count[2]`` to pin G14
          * ``gray_count[1]`` to pin M15
          * ``gray_count[0]`` to pin M14

          Similarly, under ``Scalar ports``, you'll find our
          single-bit (scalar) input ``en``. Connect this to the
          first slider switch on pin G15.

          Finally, for all of the pins, manually set their
          **I/O Std** (I/O Standard) to LVCMOS18; this is the
          default, but manually setting it should erase the
          *(default)* and tell Vivado that it's actually what
          we want.

       Once you're done, manually save the constraints (similar to
       the block design), either with ``Ctrl+S`` or by clicking
       **File -> Constraints -> Save**.

       You will get a warning that "Synthesis may go out-of-date".
       This is expected; the resources that Vivado uses and how it
       represents our design depends on our constraints. However,
       we need to initially synthesize the design to know what
       constraints we need. Click **OK**, then re-run synthesys from
       before. Now, upon opening the synthesized design, you should
       have few to no warnings pop-up, as we eliminated the critical
       warnings due to lack of constraints!

       Lastly, feel free to double-click the ``.xdc`` in the
       **Sources** window to view what the constraints actually are
       - just Tcl commands! This makes them highly portable across
       designs, if you wish to share/reuse constraints; if you
       already had the constraints, you could add them as a source
       (assuming that the top-level ports were the same).

    .. group-tab:: TCL

       .. admonition:: Adding Constraints
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``set_constraints.tcl`` script

          .. code-block:: bash

             % vivado -mode batch -source ../scripts/constraints/set_constraints.tcl

          All this script does is add our constraints file, then re-runs synthesys
          (only because we added our constraints file after; if we added our
          constraints before synthesis, we wouldn't need to re-run it). If
          you want to know how the constraints file was created, see the
          GUI commands.