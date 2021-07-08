# [Objective-C 语法进阶](https://puffhub.github.io/iOS-Crack/)



## 线程操作
```objcetivec
// 手动启动线程
NSThread *theard = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
[theard start];

// 创建并自动启动
[NSThread detachNewThreadSelector:@selector(hahaha:) toTarget:self withObject:nil];

// 获取当前线程
NSLog(@"%@", [NSThread currentThread]);

// 获取主线程信息
NSLog(@"%@", [NSThread mainThread]);

// 获取线程名字
[NSThread name];
```
```@selector```用法在[这里](https://blog.csdn.net/fengsh998/article/details/8612969)


## 延时函数 dispatch_after

```dispatch_after```能让我们添加进队列的任务延时执行，该函数并不是在指定时间后执行处理，而只是在指定时间追加处理到```dispatch_queue```该方法的第一个参数是```time```，第二个参数是```dispatch_queue```，第三个参数是要执行的```block```。

   ```dispatch_time_t```有两种形式的构造方式，第一种相对时间：```DISPATCH_TIME_NOW```表示现在，```NSEC_PER_SEC```表示的是秒数，它还提供了```NSEC_PER_MSEC```表示毫秒。第二种是绝对时间，通过```dispatch_walltime```函数来获取，```dispatch_walltime```需要使用一个```timespec```的结构体来得到```dispatch_time_t```。

```objectivec
dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 10*NSEC_PER_SEC);
dispatch_after(time, dispatch_get_main_queue(), ^{
    NSLog(@"hello");
});
```

## Block


## 待续...