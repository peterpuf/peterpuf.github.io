# [XPosed疑难杂症](https://puffhub.github.io/Android-Crack/)


<br />
## 入参类型

### 被Hook的方法某个入参类型为```Byte []```
这时候使用Xposed构建参数类型的时候可以传入 ```Array.newInstance(byte.class, 0).getClass()```

<br /> 
### 被Hook的方法某个参数类型为枚举类型
先获取枚举类型的Class **```Class<?> aClass=  XposedHelpers.findClass("xxxx", hook.cl);```**

通过Class获取枚举类的实体对象 **```aClass.getEnumConstans()```**, 该方法返回enum内部定义的对象数组, 从数组中取值即可. 

<br /> 
### 被Hook的方法某个参数类型为Interface
使用动态代理即可. [看雪链接](https://bbs.pediy.com/thread-260484.htm)


