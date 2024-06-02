## 全局WebView的Hook & 调试

### 为什么有时候用PGPangu找不到我想要的元素?

- 要找的元素 不在当前的KeyWindow上.
	
	可以自己去改PGPangu, 针对不同的Window去操作
	
	
	```
	+(void)printFlexWindow{
	    for (int i=0; i<[[UIApplication sharedApplication].windows count]; i++){
	        if (![[UIApplication sharedApplication].windows[i].description containsString:@"FLEXWindow"]){
	            continue;
	        }
	
	        [PGHelper runOnMainThread:^{
	            UIView *v = [UIApplication sharedApplication].windows[i];
	            NSLog(@"PG_HOOK_VIEW --- 开始打印FlexWindow👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊");
	            [self PElements:v needId:NO];
	            NSLog(@"PG_HOOK_VIEW --- 打印完毕FlexWindow👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊");
	            return @"";
	        }];
	    }
	}
	
	```

- 元素在webview内.


### 如何Hook Webview?

1、自己开发的Webview可以直接调试. (MonkeyDev重打包的也可以调试)

2、[GlobalWebInspact](https://github.com/ChiChou/GlobalWebInspect)

iOS & MacOS的WebView 如果说想调试的话，都需要经过一个WebInstapectord服务处理. 会和iOS & MacOS的WebView去做通信, 达到调试的效果。 当App的签名中包含以下4个内的任意一个，就可以调试
```
@"com.apple.security.get-task-allow",
@"com.apple.webinspector.allow",
@"com.apple.private.webinspector.allow-remote-inspection",  # MacOS下的Safari自带
@"com.apple.private.webinspector.allow-carrier-remote-inspection",  # Xcode 调试时自带
```


### 如何调试WebView?

1、需要打开Safari的开发菜单

MacOS: 打开Safari -> 设置 -> 高级 -> 显示开发菜单
iPhone: 设置 -> Safari浏览器 -> 高级 -> 网页检查器

2、安装好插件后需要重启Safari

3、从MacOS的Safari开发菜单中找到要调试的WebView, 就可以开始调试了.
(可以在Safari的控制台中获取当前Webview的地址，然后使用Chrome调试)


### 实战！Hook Cydia的Webview

1、获取Cydia可执行二进制文件

```
	scp -P2220 root@127.0.0.1:/Applications/Cydia.app/Cydia ~/Desktop
```

2、获取头文件

```
class-dump Cydia -H -o ~/Desktop/CydiaH
```

3、找到Webview并hook, 获取到Webview的对象地址.


4、用Cycript 动态执行, 验证是否可以执行js

```
[#0x121269330 stringByEvaluatingJavaScriptFromString:@"alert(123)"]
```















