# [MachO文件介绍](https://puffhub.github.io/Crack/iOS-Crack/)

## 简介
MachO文件是iOS和Mac OS上的可执行文件格式, 类似于Windows的PE和Linux的ELF文件.

这幅图是我写的一个Demo程序, 在viewDidLoad中写了一行NSLog所产生的MachO文件~
![Macho文件](./imgs/Macho1.png)

可以看到解析出来的MachO文件一共分为这么几块

- Mach64 Header
- LoadCommands
- List\<Section64(\_TEXT/_DATA)>