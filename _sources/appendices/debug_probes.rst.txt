Appendix B: Using Debug Probes
==========================================================================

Suppose we want to have more visibility into our design once it's on
the FPGA, and be able to see the value of signals. This is where *debug
probes* come in - Vivado's mechanism for allowing you to monitor and
select signals. Let's build on our walkthrough by adding some debug
probes to monitor signals!

.. admonition:: Do in the GUI
   :class: warning

   Since this process is interactive by nature, you should only do
   so in the GUI, although you could set up the debug cores from
   Tcl if you really needed to

.. admonition:: Adding Signals to Debug
   :class: important

   On the left, in **Flow Navigator**, under **Synthesis**,
   select **Open Synthesized Design** to open the previously
   synthesized design. From there, click on **Set Up Debug**
   in the same section to open up the debug wizard - this
   is how we'll set up our signals to debug!

   * On the welcome page, click **Next**
   * On the bottom-left, click **Find Nets To Add**. This will pull
     up a search window that will allow us to find specific nets.
     Use this window to select our ``gray_count`` and ``en`` ports.
   * Before clicking **Next**, notice that Vivado has already
     identified the clock domain for these signals in their
     entries. *However*, debug cores need a "free-running" clock;
     since our clocking wizard has a reset signal, it is not
     technically free-running. Vivado will not complain about this,
     but data will likely not be captured correctly later.
     Right-click on these entries to change the clock domains for
     our signals to the Processing System's clock, then click **Next**.
     This will have our signals sampled at 5 times faster than they're
     changing, but that's ok for our purposes.
   * Keep the sample depth (number of samples to acquire at once) and
     the input pipe stages (the delay in sampling, to improve timing)
     at their defaults of 1024 and 0, then click **Next**
   * On the summary page, verify that one debug core will be created
     for the one clock that was found, then click **Finish**

We've now successfully added our signals to probe! While the synthesis
of our design is still good, adding this new hardware has caused our
implementation to go out-of-date.

.. admonition:: Recompile the Design
   :class: important

   Follow the steps from before to generate the bitstream; Vivado
   will detect that the implementation is out-of-date, and will re-run
   it accordingly.

Once our design has been recompiled into a bitstream, re-open the
hardware manager as before, and open the target and program the
device; this time, Vivado should also detect the ``.ltx`` file for
our debug probes.

Once your board has been programmed, you should be presented with
a new view, corresponding to your debug core. It should contain:

* **Waveform**: The captured waveform of your signals
* **Trigger Setup**: Setup of the conditions when our capture should
  trigger
* **Capture Setup**: Configurations for how signals should be
  captured (we won't use)
* **Status**: An overview of the current status of the debug core.
  This should start as "Idle"
* **Settings**: The settings for the debug core (which should default
  to our configurations from before - we won't edit these)

First, let's create a condition to capture signals - this is a *trigger*:

.. admonition:: Adding a Trigger
   :class: important

   In the **Trigger Setup** tab, click the **+** icon to add a trigger.
   Select the ``en`` signal, which we'll use to trigger off of, then
   click **OK**. Edit the fields so that we trigger when our design
   is enabled; an example would be using the ``==`` operator, the
   ``[B]`` radix, and a value of ``1``.

   We'll only use one trigger, but if you were to add multiple, you
   could use the logic gate icon to configure how the independent
   triggers were combined to generate the overall trigger.

From here, we can capture some data!

.. admonition:: Capturing Probe Data
   :class: important

   First, for demonstration purposes, change the first slide switch to
   the lower position, disabling the design (``en = 0``)

   Either in the **Status** or **Waveform** tab, click the play
   icon to start capturing data.

   The **Status** tab should change to "Waiting for Trigger", and
   indicate that the capture window has sampled 512 out of 1024 samples;
   this is because our debug core (by default) captures an equal
   number of signals before and after a trigger.

   To trigger the design, change the first slide switch to the upper
   position, enabling the design (``en = 1``). This should trigger
   the design; the **Status** tab will momentarily change before
   returning to "Idle", and the **Waveform** tab should display
   the captured data. You should see the design staying
   the same before the trigger, and then counting in gray code after
   the trigger, indicating the design is working as intended! Finally,
   verify that the signals in ``gray_count`` are changing approximately
   once every 5 units in the waveform; one unit corresponds to 1 clock
   cycle of the debug core, and since our signals are connected to a
   clock that's 5 times slower, their rate of change should reflect that.

   Go through the capture process a few more times to observe that
   the captured data changes (as the place in the count will change
   each time). Congratulations - you've successfully probed the design!

