# [iOS逆向开发环境搭建](https://puffhub.github.io/iOS-Crack/)

## MonkeyDev
转载自[简书](https://www.jianshu.com/p/207801a902d1)

### **主要包含4个模块**

> **Logos Tweak**
> 
> 使用theos提供的logify.pl工具将.xm文件转成.mm文件进行编译，集成了CydiaSubstrate，可以使用MSHookMessageEx和MSHookFunction来Hook OC函数和指定地址。
>
>  Logos框架需要将hook代码写到.xm文件中，需要使用该工具将.xm文件转成.mm打包.

<br />

> **CaptainHook Tweak**
> 
> 使用CaptainHook提供的头文件进行OC 函数的Hook以及属性的获取。

<br />

> **Command-line Tool**
> 
> 可以直接创建运行于越狱设备的命令行工具。

<br />

> **MonkeyApp**
> 
> 这是自动给第三方应用集成Reveal、Cycript和注入dylib的模块，支持调试dylib和第三方应用，支持Pod给第三放应用集成SDK，只需要准备一个砸壳后的ipa或者app文件即可。
> 
> 及其方便, 安装完成后直接内置到xcode中, 可创建建MonkeyApp应用直接进行hook.


**下载**:

1、安装Theos

```sudo git clone --recursive https://github.com/theos/theos.git /opt/theos```

2、安装ldid (LDID)

``` brew install ldid``` 

<br /><br />

**安装**

1、选择制定的xcode安装

```sudo xcode-select  -s + 自己的xcode路径```

我的系统版本是OS X 11.4, 安装过程中提示我ldid安装失败, 系统版本太高, 于是去官网下载了最新的xcode13-beta, 这样一来本地就存在一个xcode12和一个xcode13-beta了, 所以需要选择安装到xcode13-beta上, 命令是 ```sudo xcode-select -s /Applications/Xcode-beta.app```

<br />

2、执行安装命令

```sudo /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/AloneMonkey/MonkeyDev/master/bin/md-install)"```

这里总是会出现下载失败的情况，只需要手动把这个文件下载下来之后使用shell运行一下即可~

<br />
到这里基本的逆向环境就搭建完成啦~




<br /> <br />
**遇到的问题**
```File /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Xcode/Specifications/MacOSX Package Types.xcspec not found```

出现这个问题的原因是找不到Specifications文件夹, 原因是从XCode12开始，就不会包含这个文件夹了, 需要从XCode11 复制一个过来即可, 没有XCode11的可以从我的阿里云盘下载. [链接](https://www.aliyundrive.com/s/ex1NvQ5JvL4)


