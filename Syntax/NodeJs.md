## [NodeJs 常用函数整理](https://puffhub.github.io/)

### 执行系统命令
```
var exec = require('child_process').exec;
var cmd = 'echo 1';
exec(cmd, function(error, stdout, stderr) {
  console.log(stdout);
});
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