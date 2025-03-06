Setup
==========================================================================

Before we can jump into the walkthrough, we'll need to do some quick setup

Tutorial Repo
--------------------------------------------------------------------------

The first thing we need to do is to clone the tutorial repo, just so we
have access to the demo design, as well as Tcl scripts if desired. Within
this, we'll create a ``project`` directory (henceforth
"project directory"), where we'll make our Vivado project:

.. code-block:: bash

   git clone git@github.com:Aidan-McNay/vivado-tutorial.git
   cd vivado-tutorial
   mkdir project
   cd project # This is the project directory!

Creating a Vivado Project
--------------------------------------------------------------------------

Now that we have our workspace, we can get started with our project!

.. tabs::

    .. group-tab:: GUI

       .. admonition:: Creating a Project
          :class: important

          Open up Vivado Design Suite (from the ``project`` directory,
          if from the command line)

          Click the **Create Project** button:

          * Click **Next** on the initial welcome
          * On the "Project Name" page:

             * Use ``vivado-walkthrough`` as the project name
             * Make sure that the location is your ``project`` directory
             * Uncheck **Create project subdirectory** (we already created
               a dedicated directory for it)
             * Click **Next**
          
          * On the "Project Type" page, make sure **RTL Project** is
            selected

             * Check **Do not specify sources at this time** - we'll
               do that later

          * On the "Default Part" page, we'll need to identify the part
            we're using. This can be done in one of two ways; **please
            follow the first**:

             * On the **Boards** tab, first click **Update Board Repositories**
               (sometimes labeled **Refresh**), then **Download**
               to update the known boards (if out-of-date), then search for
               and click your board (ex. "Zybo Z7-10"). Then click **Next**
             * On the **Parts** tab, search for and select the part name
               for your device. In our case (Zybo Z7-10), the part name
               is ``xc7z010clg400-1``. Then click **Next**

            (The reason to use a "board" instead of just a "part" is that the
            board carries more information, such as exact pins and resources
            available. While it's possible to do it with just the part
            information, the process is more error-prone)

          * On the "Project Summary Page", click **Finish**

    .. group-tab:: TCL

       .. admonition:: Creating a Project
          :class: important

          From your project directory, use Vivado to run the
          ``create-project.tcl`` script:

          .. code-block:: bash

             vivado -mode batch -source ../scripts/setup/create-project.tcl

          This particular script may take a while, as it updates the board
          repository (assuming that the board isn't already available).
          Additionally, this script (unlike others) opens the Vivado GUI
          at the end, just so you can see what's happened.

After creating the project, you should now see Vivado's main GUI open
to your project! Let's briefly go over the different windows present:

* **Flow Navigator** *(left)*: This is the main control panel for your
  project. From here, you can run different steps, such as simulation,
  testing, and synthesis. Clicking on any of the steps will automatically
  run all previous steps necessary
* **Sources** *(top-middle)*: All of the sources for your project. We
  don't have any right now, but will add to them in the next step
* **Project Summary** *(top-right)*: An overview of the status of your
  project
* **Properties** *(middle-middle)*: A panel to view and edit properties
  of various project components
* *(bottom)*:
 
  * **Tcl Console**: A shell that shows all of your actions as Tcl
    commands. This is highly useful if you ever want to script actions
    that you take in the GUI, *or* to use as a Tcl shell for your project
  * **Messages**: Any messages Vivado has
  * **Log**: The log from different steps taken on your project
  * **Reports**: Reports from different steps of the project. This is
    where you will get information such as area, power, slack, etc.
  * **Design Runs**: The status of all the runs/steps taken on your design

All of these windows (except the Flow Navigator) can be closed; if you
want to reopen them, you can do so from the **Window** tab on the top.

Lastly, you'll notice a file named ``vivado-walkthrough.xpr`` now in
your project directory. This is the Vivado project you've created,
which is automatically saved by Vivado whenever you make edits. If
you close Vivado, you can re-open your project from this file,
either from the GUI (using "Open Project") or from the command line:

.. code-block:: bash

   vivado vivado-walkthrough.xpr