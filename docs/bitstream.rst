Generating a Bitstream
==========================================================================

Now that we have our final design, we have to get it into a form that we
can put on our board. This is known as a *bitstream*; an (encrypted) file
that represents our implemented design in its entirety.

.. admonition:: Encryption
   :class: note

   Having the bitstream encrypted is useful from a security perspective;
   while you may not want sensitive design files to get out, you can
   leave your bitstream lying around, and no one will be able to
   reverse-engineer the design it represents.

Generating a Bitstream
--------------------------------------------------------------------------

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Generating a Bitstream
          :class: important

          On the left-hand side, in **Flow Navigator**, under
          **Program and Debug**, click **Generate Bitstream**, then click
          **OK**.

          This should hopefully take much less time than the implementation,
          as we're not going through the flow, but simply packaging the
          result.

          Eventually, you should hopefully get a pop-up that the run
          completed successfully - we're good to go!

    .. group-tab:: TCL

       .. admonition:: Generating a Bitstream
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``impl_design.tcl`` script

          .. code-block:: bash

             vivado -mode batch -source ../scripts/bitstream/gen_bitstream.tcl

          Check the output logs for the line
          ``write_bitstream completed successfully``, and you should be good!

Putting a Bitstream on the Board
--------------------------------------------------------------------------

After this process, we should have a bitstream (located as ``top.bit`` in
``vivado-walkthrough.runs/impl_1``)

.. admonition:: Debug Probes
   :class: note

   While the ``.bit`` file is the primary output, some users may later
   incorporate debug probes into their design; see
   :doc:`appendices/debug_probes` for more
   details. In that case, we'd also have a ``top.ltx`` file that specifies
   our debug probe configuration.

All that's left to do is put this on our board - this is best done from
the GUI.

.. admonition:: Programming the Board
   :class: important

   Ensure that your device is on and plugged in.
   
   On the left-hand side, in **Flow Navigator**, under
   **Program and Debug**, click **Open Hardware Manager**.

   You should initially have a banner at the top that says
   "No hardware target open"; click **Open target**, then
   **Auto Connect**. This will launch a "host" to connect to
   your device; you should see it show up on the left-hand
   side.
   
   Once there, click **Program Device** in the
   banner (or from **Tools**) to program the device.
   Vivado should automatically identify the bitstream
   (and debug probes, if any) associated with your design
    - click **Program**.

   Vivado will take a second to program the device, and then
   you should be good to go! For this design, this looks like
   the LEDs cycling through all gray codes when the switch is
   on (looks like the LEDs are all on, since it happens very
   fast), and pauses on a particular one when the switch is
   turned off.

   Congratulations - you've just programmed a board with Vivado!

This is also where the portability of bitstreams comes in handy. If you
need to program from a different device than you compiled with (perhaps
because of license availability), you can simply transfer the bitstream
(and possibly the debug probes), and open Vivado only with the
hardware manager to program a device (which doesn't require a license).