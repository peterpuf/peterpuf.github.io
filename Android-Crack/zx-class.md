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

<br />
#### 总结: 任何方向的逆向都可以**围绕底层/系统方法进行hook**, 通过打印堆栈的方式来判断代码的运行逻辑.


<br /><br />
## 0x02 XPosed使用技巧 + ArtXposedHookNatve
