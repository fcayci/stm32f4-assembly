# stm32f4-assembly

Assembly template for an STM32F4 Discovery board

## Install
* Toolchain - [GNU ARM Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)
* (Windows only) - [MinGW and MSYS ](http://www.mingw.org/)
* Programmer - [STLink](https://github.com/texane/stlink)

## Compile
* Browse into the directory and run `make` to compile.
```
Cleaning...
Building template.s
   text    data     bss     dec     hex filename
     60       0       0      60      3c template.elf
Successfully finished...
```

## Program
* Run `make burn` to program the chip.
```
...
Flash written and verified! jolly good!
```
