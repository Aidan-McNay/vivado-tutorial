Overview
==========================================================================

Welcome! This tutorial aims to familiarize you with Vivado Design Suite,
as well as take you through the process of completing a design from
inception to implementation on an FPGA.

This tutorial will instruct you to run some command-line arguments; when
doing so, they will be in the following format (users should omit the
``%``, which is used to denote a command):

.. code-block:: bash

   % echo "Hello, Vivado Tutorial User"

This tutorial assumes that:

* You have access to Vivado Design Suite
* You have previous experience with RTL Design
* You have access to a Xilinx FPGA Board

.. admonition:: Use on ECELinux
   :class: info

   Cornell ECE students have access to Vivado Design Suite through
   ECELinux (as of time of writing). This is done by first loading
   the ``xilinx`` module:

   .. code-block:: bash

      % module load xilinx

   From there, Vivado can be opened simply with

   .. code-block:: bash

      % vivado

   Note that this requires a graphical connection; this can be done
   through X11 Forwarding, using a workstation in Phillips 314, or
   a separate application like

   * Microsoft's Remote Desktop (preferred)
   * `MobaXTerm <https://mobaxterm.mobatek.net/>`_
   * `X2Go <https://wiki.x2go.org/doku.php>`_

When the tutorial asks you to perform an action, it will be in a green
box like the following:

.. admonition:: Example Task
   :class: important

   This is a task you should do! (well, not really in this case)

Finally, many of the tasks we'll do with Vivado can be done through the
GUI, but can also be scripted with a Tcl script, which Vivado can use to
automate commands. While the tutorial won't go over scripts for each of
these actions, it will provide them if you wish to examine/use them.
Tasks that have this option will have a corresponding toggle button
above them, shown below:

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Example Task
          :class: important

          This is a task to be run in Vivado's Graphical User
          Interface (GUI)!

    .. group-tab:: TCL

       .. admonition:: Example Task
          :class: important

          This is a task to run actions with a Tcl script!
