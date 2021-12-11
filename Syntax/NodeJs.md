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