# [FishHook原理及应用](https://puffhub.github.io/Crack/iOS-Crack/)

有些时候我们需要对系统的函数进行hook, 目前用的最多的就是FishHook了。 [Github地址](https://github.com/facebook/fishhook)

有用的文件其实只有```fishhook.h```和```fishhook.c```, 当我们克隆项目到本地之后可以在头文件中看到里面只提供了一个结构体```rebinding```和两个方法```rebind_symbols```、```rebind_symbols_image```. 

想要对系统函数进行hook, 这里就需要使用```rebind_symbols```方法.

## 原理
fishhook的原理非常简单, 实际上就是**保存一下原函数的地址**, 当原函数被调用的时候, **fishhook会把地址设置为指定的一个方法地址**, 这样我们就可以进行一些骚操作, 然后再调原函数地址返回/或者不返回。

<br/>

## 使用方式
首先将fishhook的两个文件拷贝到项目中.

**这里以hook钥匙串操作的方法为例**

常用操作钥匙串的函数有这4个, 现在我们对这4个函数进行hook.

```
OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)

OSStatus SecItemDelete(CFDictionaryRef query)
```

**首先要定义一个函数指针**, 用于保存原来的函数. 函数指针的定义方式: ```函数返回值类型 (* 指针变量名) (函数参数列表);```

```
static OSStatus (*orig_SecItemAdd)(CFDictionaryRef attributes, CFTypeRef * __nullable CF_RETURNS_RETAINED result)
```

接下来写一个新的方法, 用于fishhook修改函数入口后, 走到我们的方法里来.

```
static OSStatus SecItemAddHook(CFDictionaryRef attributes, CFTypeRef *result){
    return orig_SecItemAdd(attributes, result);
}
```

使用rebind_symbols进行方法替换

```
struct rebinding rebn;
rebn.name = "SecItemAdd";
rebn.replacement = SecItemAddHook;
rebn.replaced = (void*)&orig_SecItemAdd;
struct rebinding rebns[1] = {rebn};
rebind_symbols(rebns, 1);
```

完整.m文件

```
//
//  KeychainHook.m
//  meituan11.13.407Dylib
//
//  Created by admin on 2021/12/17.
//

#import "KeychainHook.h"
#import "fishhook.h"


static OSStatus (*orig_SecItemAdd)(CFDictionaryRef attributes, CFTypeRef result)
API_AVAILABLE(macos(10.6), ios(2.0));

static OSStatus (*orig_SecItemCopyMatching)(CFDictionaryRef query, CFTypeRef result)
API_AVAILABLE(macos(10.6), ios(2.0));


static OSStatus (*orig_SecItemUpdate)(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
API_AVAILABLE(macos(10.6), ios(2.0));

static OSStatus (*orig_SecItemDelete)(CFDictionaryRef query)
API_AVAILABLE(macos(10.6), ios(2.0));


@implementation KeychainHook
+ (void)load{
    struct rebinding rebn;
    rebn.name = "SecItemAdd";
    rebn.replacement = SecItemAddHook;
    rebn.replaced = (void*)&orig_SecItemAdd;
    struct rebinding rebns[1] = {rebn};
    rebind_symbols(rebns, 1);
    
    struct rebinding rebn1;
    rebn1.name = "SecItemCopyMatching";
    rebn1.replacement = SecItemCopyMatchingHook;
    rebn1.replaced = (void*)&orig_SecItemCopyMatching;
    struct rebinding rebns1[1] = {rebn1};
    rebind_symbols(rebns1, 1);

    struct rebinding rebn2;
    rebn2.name = "SecItemUpdate";
    rebn2.replacement = SecItemUpdateHook;
    rebn2.replaced = (void*)&orig_SecItemUpdate;
    struct rebinding rebns2[1] = {rebn2};
    rebind_symbols(rebns2, 1);
    
    struct rebinding rebn3;
    rebn3.name = "SecItemDelete";
    rebn3.replacement = SecItemDeleteHook;
    rebn3.replaced = (void*)&orig_SecItemDelete;
    struct rebinding rebns3[1] = {rebn3};
    rebind_symbols(rebns3, 1);
}

static OSStatus SecItemAddHook(CFDictionaryRef attributes, CFTypeRef *result){
    return orig_SecItemAdd(attributes, result);
}


static OSStatus SecItemCopyMatchingHook(CFDictionaryRef query, CFTypeRef *result){
       return orig_SecItemCopyMatching(query, result);
}

static OSStatus SecItemUpdateHook(CFDictionaryRef query, CFDictionaryRef attributesToUpdate){
    return orig_SecItemUpdate(query, attributesToUpdate);
}

static OSStatus SecItemDeleteHook(CFDictionaryRef query){
    return orig_SecItemDelete(query);
}
@end

```