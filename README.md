﻿Simu5G
=======

5G NR and LTE/LTE-A user-plane simulation model, compatible with the 
INET Framework.
Website: http://simu5g.org

Requirements
----------


Installation Guide
----------
0. Put all projects under the same folder (your workspace)
1. Install the latest Omnetpp
2. Install the INET 4.4 (import and build)
3. Install the Simu5G 1.2.1 (better install from the "Omnetpp->Help->Install Simulation Models")
4. Make sure the Simu5G Cars is enabled in the "Project Features"
5. In "Project Reference", make sure "inet4.4" is selected.
6. Build the Simu5G and make sure simu5g/src/libsimu5g_dbg.so and libsimu5g.so are created
7. Install the Veins-5.2 (First, no submodules are together imported)
8. Build the Veins-5.2 and make sure veins-5.2/src/libveins_dbg.so and libveins.so are created
9. Import the Veins-5.2 again and this time only choose the submodule of veins_inet
10. Go to the 'Project Explorer' of Omnetpp and change 'Project Presentation' to 'flat'
11. Change the 'Project Reference' of veins_inet to inet4.4 and veins-5.2 (do not choose inet and veins, these are wrong)
12. Build the veins_inet, and make sure veins_inet/src/libveins_inet_dbg.so is created.
13. Go to Simu5G and include the veins-5.1 and veins_inet in the 'Project Reference'
14. Build Simu5G again
