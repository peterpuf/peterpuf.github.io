# zx-kc


## 0x01 关键代码定位技巧

### 常用工具
**DDMS** 用于定位指定时间内某个进程运行时调用的方法.

**BuildProp Enhancer** XPosed模块, 用于将手机系统修改为Debug模式, 配合DDMS使用.

**UI Automator** 用于通过UI层面获取控件及其信息.

<br />
### 代码定位
**1、使用[Encryptstack XPosed插件](./zx/Encryptstack_v_3.0.apk)进行定位**

**原理**: 

- Hook Application的onAttach方法, 获取目标进程的ClassLoader, 防止有些类找不到.
- Hook 常用加密类的方法, 打印入参出参、堆栈.
- Hook 序列化的常用方法, 打印入参出参、堆栈.

### JADX中直接对常量进行搜索
**App反编译后, 使用JADX直接全局进行搜索**

### 技巧
**1、Hook ClassLoader的loadClass方法可以获取到所有ClassLoader.** (将获取到的ClassLoader保存为一个集合, 当要查找一个类的时候, 首先尝试通过Class.forName进行Hook, 找不到则尝试使用进程默认的ClassLoader进行Hook, 还是找不到则可以遍历该集合, 使用其中的ClassLoader进行查找)

<br />
#### 总结: 任何方向的逆向都可以**围绕底层/系统方法进行hook**, 通过打印堆栈的方式来判断代码的运行逻辑.




<br /><br />
## 0x02 XPosed使用技巧 + ArtXposedHookNaitve 上
### 加密算法防护
**1、 手动实现常用加密算法[Base64 / MD5 / AES](待补充)**

**2、 加壳, 代码混淆**

<br />
### Hook Interface接口类
**1、可以Hook Interface的上层调用类, 通过param.arg[\*].getClass().getName() 获取Interface的实现类, 之后再去hook**

**2、通过动态代理, ```Proxy.newProxyInstance()```进行动态代理, 具体可看[这里](https://bbs.pediy.com/thread-260484.htm)**

<br />
### XPosed 如何Hook Native?
**自己写一个So, 通过XPosed注入到目标进程中**

正常加载So文件有两种方式, ```System.load()```和```System.loadLibrary()```, 前者在安卓4.4版本下可使用, 在4.4以上被认为是危险方法, 在Art模式下只可以使用后者进行So文件的加载. 这两个方法最终一定都会走到```doLoad()```方法. 所以可以通过


由于在Android7.0以上使用dl_open打开So文件会有限制, 所以可以借助开源框架dlfc,  原理是dlfc会遍历map文件, map文件中记录了一切进程的内存地址范围. 

待续...


<br />
## 0x03 XPosed使用技巧 + ArtXposedHookNaitve 下
待续...



<br />
## 0x04 动态注册对抗
### 如何定位Native的动态注册?

**RegisterNativeMethods分析**

RegisterNatives注册时给ArtMethod fnptr赋值的过程, fnptr是JNI函数的函数地址.

- 1、检测方法数量, 如果方法数量不匹配会报异常,
- 2、遍历注册

待续...


<br />
## 0x05 单双抓包证书验证
Android 7.0以上系统默认不信任用户手动安装的证书, 所以可以在Root后讲证书移动到系统证书. ```/system/etc/security/cacerts/```

### 单项验证:
仅在客户端进行严重


### 双向验证:
客户端和服务端双向验证

### 单项验证常用证书验证方式:

- 证书验证```sslSocketFactory```

- 域名验证``` hostNameVerifier```

- 证书锁定```certificatePinner``` (只有OKHTTP有这个验证)

#### JustTrustMe 原理
JustTrustMe Hook了常用框架中的证书验证方法, 过证书验证

#### JustTrustMePlush 原理
在JustTrustMe的基础之上, 做了内存识别的功能, 获取内存中全部的类, 尝试遍历类的特征(防止被混淆)


### 双向验证处理
1、App证书提取 -> 证书导入
2、Hook 发包器













<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
