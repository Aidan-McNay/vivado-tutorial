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

    .. group-tab:: TCL

       .. admonition:: Running Implementation
          :class: important

          Either from **Tools -> Run Tcl Script** or from the command
          line (shown below), run the ``impl_design.tcl`` script

          .. code-block:: bash

             vivado -mode batch -source ../scripts/bitstream/gen_bitstream.tcl

          Check the output logs for the line
          ``impl_1 finished``, and you should be good!