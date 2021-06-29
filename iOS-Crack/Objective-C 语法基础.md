# Objective-C 语法基础

## 简介
Objective-C，通常写作ObjC或OC和较少用的Objective C或Obj-C，是扩充C的面向对象编程语言。它主要使用于Mac OS X和GNUstep这两个使用OpenStep标准的系统，而在NeXTSTEP和OpenStep中它更是基本语言。

Objective-C是编写以下应用的利器：

- iOS操作系统
- iOS应用程序
- iPad OS操作系统
- iPad OS应用程序
- Mac OS X操作系统
- Mac OS X应用程序

(以上来源: [百度百科](https://baike.baidu.com/item/Objective-C))

In people words: **Objective-C是C的超集, 可以在Objective-C中使用C语言做的任何事情, 仅仅是在C的基础上新增了很多方面的语法, 例如 ```#import```等。**

当年由于Jobs被自家的**Apple**赶出家门, 于是自立门户**NeXTSTEP**, 在系统和软件层面碾压了当时的**Apple**, 最终在1994年被**Apple**公司收购, 自此**Apple**公司开始使用**NeXTSTEP**的Objective-C语言, 并在后来的迭代中将**NeXTSTEP**保留下来的一些函数以```NS```开头命名。
<br /><br />


## 文件名称规则
和```C语言```一样, OC的文件也由两部分组成. (其实支持三种类型)

- ```.h``` ->  **头文件**, 包含 ```类名```、```类继承的父类```、```方法```、```变量声明```; 

- ```.m``` -> **实现文件**, 可以包含```Objective-C```的代码和```C```代码, 同时它是对.h文件中方法的实现, 外部不能访问;

- ```.mm``` -> **实现文件**,  和```.m```文件类似, 唯一不同的点在于除了可以包含```Objective-C```和```C```的代码之外, 还可以包含```C++```代码; 仅在你的```Objective-C```代码中确实需要使用```C++```类或者特性的时候才用这种扩展名。



## 语法
使用Xcode创建的app中, ```main.m```文件中的主函数

```objectivec
# import <UIKit/UIKit.h> 
# import "AppDelegate.h"
	
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
```
<br />

这里直接列出基本语法的使用方式, 感兴趣可以自己搜一下。或[菜鸟教程](https://www.runoob.com/w3cnote/objective-c-tutorial.html)

-  引入头文件: ```# import```、```# include```

-  调用方法: ``` [obj method:arg1 arg2:arg2] ```
<br />**(这里需要说明一下, 当一个方法存在多个参数时, 第一个参数可以不指定参数名, 后面的参数都需要指定参数名)**.

-  创建对象: ```[[obj alloc] init]``` 或 ```[ obj new ]``` 
<br /> **只有在OC2.0中, 创建的对象不需要参数时, 才可以用第二种直接new的写法**

-  类定义(.h): ```@interface MyClass : NSObject {} @end```
<br />**以关键字@interface作为开始, @end作为结束**

- 类实现定义(.m): ``` @implementation MyClass{} @end```
<br />**以关键字@ implementation作为开始, @end作为结束**

- 定义一个类: 

	```objectivec
	@interface classA : NSObject{
		// 实例变量
		int id;
		id a; // 这里的id代表返回值可能为任意类型
		
		// 类方法, +开头 (类似于Java中的静态方法, 可在不实例化类的情况下调用)
		+(void) method1;
		
		// 实例方法, -开头 (必须先实例化类, 才能调用)
		-(id) method2;
		-(id) method2: (int) a1;
		-(id) method3:(int) a1 withArg2:(int) a2;
	}
	@end
	```
































