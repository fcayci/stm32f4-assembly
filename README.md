# stm32f4-assembly

Assembly template for STM32F4 family of products using Cortex-M4 that turns on an LED connected to GPIO pin 12.

Note that

- This is a simple template to demonstrate the necessary items to write to a GPIO pin for educational purposes.
- It does not need any additional libraries or startup codes.
- Data section is not initialized, so if you use RAM, things might not work as intended.
- Clock settings are left default.
- Tested on STM32F4 Discovery board.

## Installation

Clone the project using `git clone https://github.com/fcayci/stm32f4-assembly`.

## Development

There are two options for development. First one is to use [STM32CubeIDE](https://www.st.com/en/development-tools/stm32cubeide.html) from ST. Second one is the setup your own development environment. Both options are supported with relevant project settings or makefiles.

### Option 1 - STM32CubeIDE

- Download and install [STM32CubeIDE](https://www.st.com/en/development-tools/stm32cubeide.html). Select a workspace then import existing project to your workspace.
- You do not need any additional tools. It comes with the compiler and debugger pre-installed.
- Rest of the sections are for Option 2.

### Option 2 - Custom development environment

- Get **toolchain** (for compiler and binutils) from [GNU Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)
- *For windows only*, install **make** tool. You can just get the make tool from [gnuwin32](http://gnuwin32.sourceforge.net/packages/make.htm). Alternatively you can install the minimalist GNU tools for windows from [mingw](https://mingw-w64.org/) and [MSYS](https://www.msys2.org/)
- For the **programmer/debugger**, you can use - [stlink](https://github.com/texane/stlink) or [OpenOCD](http://openocd.org/). Though only stlink utility support is added.
- You can use your favorite code editor to view/edit the contents. Here is an open source one: [Visual Studio Code](https://code.visualstudio.com/).

#### Compile

[makefile](makefile) contains the necessary build scripts and compiler flags.

Browse into the directory and run `make` to compile. You should see a similar output as shown below.
```
Cleaning...
Building template.s
   text    data     bss     dec     hex filename
     60       0       0      60      3c template.elf
Successfully finished...
```

If you see any errors about command not found, make sure the toolchain binaries are in your `PATH`. On Windows check the *Environment Variables* for your account. On Linux/macOS run `echo $PATH` to verify your installation.

#### Program

Run `make burn` to program the chip.

```
...
Flash written and verified! jolly good!
```

Install the [ST LINK](https://www.st.com/en/development-tools/st-link-v2.html) drivers if you cannot see your board when `make burn` is run.

#### Disassemble

Run `make disass` to disassamble.

#### Debug

In order to debug your code, connect your board to the PC, run `st-util` (comes with stlink utility) from one terminal, and from another terminal within the project directory run `make debug`. You can then use general **gdb** commands to browse through the code.
