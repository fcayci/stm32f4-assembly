# stm32f4-assembly

Assembly template for a STM32F4 Discovery board

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
     56       0       0      56      38 template.elf
Successfully finished...
```

## Program
* Run `make burn` to program the chip.
```
...
Flash written and verified! jolly good!
```
