# [iOS自动点击](https://puffhub.github.io/iOS-Crack/)

## 背景
iOS自动点击顾名思义是在iOS设备上进行模拟点击的操作, 一开始按照想法想做一个类似安卓自动点击技术方案的产品(hook activity生命周期, 控件直接performClick...), 但真正进入开发后, 我发现我想的太简单了...

就目前能查到的资料来看, 想在iOS上实现自动点击, 只有这几种解决方案

- UI Automator （已废弃)
- Appium	(停止更新, Github项目无法跑起来)
- XCUITest	(官方的UI自动化框架)
- KIF	(可用)


## 方向选择
一个废弃, 一个本地跑不起来...

试试官方框架..

XCUITest框架确实好用, 只需要导入一个framework就可以了, 但后来发现，通过这种方式完成自动点击必须依赖于xcode-build, 这就很狗了啊, 脱机自动点击不香嘛😈

因为目前线上运行的自动点击项目依赖于[PTFakeTouch](https://github.com/Ret70/PTFakeTouch), 但我想尝试更好的方式(不信这个邪), 于是去各个交流群请教, 结果这小子居然把我当傻子耍..

![当我是傻子](./ptfaketouch-500.png)




