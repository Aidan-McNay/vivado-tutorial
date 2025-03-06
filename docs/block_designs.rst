Adding Block Designs
==========================================================================

Many FPGA tools additionally come with their own libraries of IP that
users can include in their designs. In Vivado, these are known as
**block designs**. Block designs include some helpful hardware, such as
protocol adapters, as well as other resources like clock generators.

.. admonition:: Board Dependency
   :class: warning

   The resources available will largely vary between boards; accordingly,
   this section is board dependent. If you have another board, not all
   of the same IP blocks will be available

Here, we'll change the frequency of our clock to slow down our counter
a bit from the default of 50MHz

.. tabs::

    .. group-tab:: GUI

       First, start by creating a new block design

       .. admonition:: Creating a Block Design
          :class: important

          On the left, in **Flow Navigator**, under **IP Integrator**,
          select **Create Block Design**:
          
          * Name the design ``clk_gen``
          * Have the directory be the default ``<Local To Project>``
          * Keep the default source set of ``Design Sources

       This will open up the **Block Design** window, with a few
       new tabs:

       * **Design**: The design hierarchy of our block design
       * **Diagram**: A visual block diagram of the design

       Next, let's add some blocks!

       .. admonition:: Adding IP
          :class: important

          In the **Diagram** tab, click the **+** icon or right-click and
          select **Add IP**. Search for "Clocking Wizard", select the
          result, then click Enter to instantiate it. Repeat this process
          to ass a "ZYNQ7 Processing System"

        In the **Diagram** tab, you can now see a block diagram of our new
        IP blocks. Additionally, our hierarchy in the **Design** tab has
        been updated.

        Let's make some connections between these two!

        .. admonition:: Connecting IP
          :class: important

          In the **Diagram** tab, hover over the ``FCLK_CLK0`` pin of the
          ZYNQ7 Processing System, then click and drag to start making a
          connection. Drag this close to the ``clk_in1`` pin of the
          Clocking Wizard; once you get close, Vivado will recognize
          that ``FCLK_CLK0`` is a clock output, and ``clk_in1`` is a clock
          input, and will snap to that connection. Release your mouse to
          connect the two, then repeat to connect ``FCLK_RESET0_N`` of
          the processing system to ``reset`` of the Clocking Wizard, as
          well as ``M_AXI_GP0_ACLK`` to ``FCLK_CLK0`` in the processing
          system (just to avoid errors later on)

        We now need to customize our clocking wizard to get our
        desired frequency.
        While we could directly edit the block's configurations in
        the **Properties** window, it's far more clear to edit them with
        the **Customize Block** tool.

        .. admonition:: Customizing Our Block
          :class: important

          In the **Diagram** tab, click on the Clocking Wizard, then click
          the wrench icon, or right-click and select "Customize Block":

          * Under "Clocking Options", under "Input Frequency", switch from
            "Auto" to "Manual", then set it to 50MHz (the frequency of
            ``FCLK_CLK0`` from the processing system)
          * Under "Output Clocks":

             * Change the output frequency of ``clk_out1`` to 10MHz
             * At the bottom, change the reset type to "Active Low",
               and uncheck ``locked`` (this is whether we've locked onto
               the clock frequencey, which we won't use)
          * Click **OK**

        Finally, we need to create the external interface for our design!

        .. admonition:: Adding pins
           :class: important

           Right-click in the **Diagram** tab, then click **Create Port**
           (note that **Create Interface** port would allow us to create
           a particular kind of interface/bundle of signals, if we wanted)

           Name the port ``clk_10mhz``, make the direction **Output**, and
           make the type **Clock**. Click **OK**

           This should create a new pin in the block diagram. Connect it to
           ``clk_out1`` of the Clocking Wizard.

        At this point, our block design is finished! It should look like
        this:

        <insert image>

        Vivado does not automatically save block designs for us (notice
        the star in the upper-left hand corner); do so either with
        ``Ctrl+S`` or **File -> Save Block Design**

        .. admonition:: Finishing Up
           :class: important

           There are a few last things we want to do to finish up our
           block design:

           * **Validation**: Vivado can help validate our block design,
             to try and catch any obvious mistakes. Click on
             **Tools -> Validate Design**. You should hopefully get that
             validation was successful!
           * **Generation**: We additionally need to generate the design
             files for our block design. On the left-hand side, in
             **Flow Navigator**, under **IP Integrator**, click on
             **Generate Block Design**. Click **Generate** in the pop-up.
             Vivado will think for a bit, then click **OK** when it's done.

        The design files have now been generated for our design! If you go to
        the **Sources** window, under our ``CLK_gen`` block design, you should
        now see ``CLK_gen.v``, which is the Verilog interface for our design.
        Examining this (although it's a little messy), you should find only
        one port, an output signal named ``clk_10mhz``; this is our generated
        clock!

        After these steps, our block design will need to be saved again, then
        you can click the **X** in the top-right hand corner to close the
        block design and return to the normal view.

    .. group-tab:: TCL

       .. admonition:: Example Task
          :class: important

          This is a task to run actions with a Tcl script!