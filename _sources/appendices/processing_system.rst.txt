Appendix A: Using the Zynq7 Processing System
==========================================================================

Many designs will want to include the Zynq7 Processing System in their
block designs; it helps define the connections from user hardware to the
embedded microcontroller. Beyond this, it also provides some useful
features, including:

* A generated 50MHz clock (although the system can be directly
  configured to produce up to 4 clocks of different frequencies from
  the PLLs)
* A reset signal (user hardware otherwise has no way to connect to
  the on-board reset button)

In the documentation, you will commonly see the system abbreviated as
**PS**. The other common acronym is the other section of the board,
the Programmable Logic (PL). If you don't wish to use the system
clock, the Zybo additionally provides a 125MHz reference clock
directly to the PL.

Using in a Block Design
--------------------------------------------------------------------------

Using the PS in a block design involves instantiating the appropriate
system. However, when you instantiate it, you will see a banner at the
top indicating to **Run Block Automation**. Users should click this,
and ensure that **Apply Board Preset** is checked. This is how the
PS will know the correct pin mapping.

.. admonition::  Presets
   :class: warning

   If you choose to further customize the board, you will notice that
   you can set the "preset" of the board. Unfortunately, this doesn't
   work for the Zybo Z7-10 (`source <https://forum.digilent.com/topic/9087-zybo-z7-20-zynq-presets/>`_),
   and the presets don't appear. Despite the current preset being
   "None", our design is still properly configured; you can see this
   with the check marks on the block diagram, which indicate that the
   respective peripheral is configured:

   .. image:: ../img/configured-zynq7.png
      :width: 70%
      :align: center

Note that this additionally created ``DDR`` and ``FIXED_IO`` ports; **those
are necessary** (see below)

Top-Level Connections
--------------------------------------------------------------------------

Block Designs come with their own constraints. When instantiating the
Zynq7 system, the constraints it creates are shown below:

.. literalinclude:: CLK_gen_processing_system7_0_1.xdc
   :class: toggle

While we don't need to understand all of these, notice that the
processing system references some of its ports (ex. ``MIO[53]``), and
sets properties that only exist if they are mapped to I/O ports
(ex. ``iostandard``). If we don't connect these to ports, these
directives will fail, and a bitstream won't be generated.

Because of this, we must connect at least some ports of the
system to ports in the top-level module; see the block design in the
walkthrough for a minimal example. Note that the constraints apply to
the names of the ports for the processing system; accordingly, the
names of the top-level ports don't matter, but must be present.
   