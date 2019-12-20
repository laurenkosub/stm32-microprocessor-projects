MoToScope  is software running on the STM32L476 Discovery kit which provides back-end support for a digital stoarage
oscilloscope (DSO). MoToScope functons running on the PC will provide MoToScope’s user control and
presentation interface. MoTo’scope will be controlled faom the PC USB port using the Micro-on-Tether (MoT) command
protocol. 

Tools and Software Required/Recommended:
1 http://www.openstm32.org/System%2BWorkbench%2Bfor%2BSTM32
2 https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads – for your situation
3 https://www.st.com/en/embedded-software/stsw-link004.html – programming application for Windows
4 https://www.st.com/en/development-tools/stsw-link009.html – USB driver for Windows

Contents of Project Directory
- Maintainer Document
- User Manual
- Acceptance Tests
- DiscoBlinkMoT : Project code directory. This contains all of the source files that are required to run the MoToScope
    - files of note: main11() --> where program starts
    - MoT_Comm_DMA.S --> DMA configurations and modifications are stored here
    - MoT_System/MoTdevice_Scope.S --> MoToScope command handling is done here. Also contains mode logic, trigger logic, and other variables
    - LL_device/LCDDisp.S --> configuration for LCD display to be run on startup
    - misc_utilities.S --> contains ADC reporting 
- hex2MoTcmd.c --> c file that when compiled can help a user generate MoT commands for the MoToScope
    - compile with : gcc -c hex2MoTcmd.c -o hex2MoT
    - run : ./hex2MoT XX YYYY ZZZZZZZZ --> input is restricted to only only 2-,4- or 8-digit numbers using hex charactes 0-9,A-F,a-f 
-  MoTdevice_TriangleWaveGen01_readme --> readme that explains how to use the TriangleWaveGen01 device in the project
   code in order to generate inputs to test ADC functions from the MoT serial console. The TriangleWaveGen01 code was provided by 
   William Hawkins (University of Maryland). In order to use this to test you will have to ensure you add it to the device list
   in the admin MoT config file in the project.