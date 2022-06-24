## [NodeJs 常用函数整理](https://puffhub.github.io/)

### 执行系统命令
```
function execCmd(){
	var exec = require('child_process').exec;
	var cmd = 'echo 1';
	exec(cmd, function(error, stdout, stderr) {
	  console.log(stdout);
	});
}
```

### 读取控制台
```
function readlineSync(msg) {
  process.stdout.write(msg);
  return new Promise((resolve, reject) => {
      process.stdin.resume();
      process.stdin.on('data', function (data) {
          process.stdin.pause(); // stops after one line reads
          resolve(data);
      });
  });
}
```

### 读取文件
```
const fs = require('fs');
function readFile(fileName) {
  return fs.readFileSync(fileName, 'utf-8')
}
```

### 覆盖写文件
``` 
function writeByName(fileName, str) {
  fs.writeFileSync(fileName, str, 'utf8', function (err) {
      if (err) {
          return console.log(err);
      }
      console.log("保存完成");
  });
}
```

### 遍历文件夹
```
const fs = require('fs');
const path=require('path');
function travel(dir,callback){
    fs.readdirSync(dir).forEach((file)=>{
        var pathname=path.join(dir,file)
        if(fs.statSync(pathname).isDirectory()){
            travel(pathname,callback)
        }else{
            callback(pathname)
        }
    })
}
travel('./cookies',function(pathname){
    console.log(pathname)
})
```

### 发请求(get)
```
const http = require("http");
function doGet(){
	http.get('http://www.baidu.com', resp => {
	  let data = "";
	  resp.on("data", function(chunk) {
	    data += chunk;
	  });
	  resp.on("end", () => {
	    console.log(data);
	  });
	  resp.on("error", err => {
	    console.log(err.message);
	  });
	});

}

```


### 获取滑动轨迹

```
var a123 = []
window.onmousemove = function(event){
            var nDiv = document.createElement('div')  //创建新的div
            var e = event || window.event   //获取事件对象
            //设置div的样式(红色小圆点)和位置(鼠标当前位置)
            nDiv.style.cssText = "position:absolute; width:5px; height:5px; background-color:red; border-radius:50%"   
            nDiv.style.left = e.pageX + "px"
            nDiv.style.top = e.pageY + "px"
            a123.push({'x':e.pageX, "y": e.pageY});
            console.log(a123);
            
            //把创建好的div添加到body里面
            document.body.appendChild(nDiv)

            //延迟定时器实现一秒后删除效果
            setTimeout(function(){
                nDiv.remove();
            },1000)
        }

setTimeout(function(){
                console.clear()
                a123 = []
            },5000)

```