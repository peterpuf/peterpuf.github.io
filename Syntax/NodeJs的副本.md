## [Puppeteer 脚本整理](https://puffhub.github.io/)

### 初始化脚本
```
npm install puppeteer
npm install sleep-promise
```

```
const puppeteer = require('puppeteer');
const sleep = require("sleep-promise")

async function main() {
    try {
      const browser = await puppeteer.launch({headless:false});
      [page] = await browser.pages();
      await page.goto("https://www.baidu.com");
      await sleep(20000);
      await browser.close();
      
    } catch (err) {
      console.error(err);
    }
  }
  
async function run(){
	main();
}
run();
```

### 设置UA
``` await page.setUserAgent(ua);```

### 获取Cookie
``` 
var cookie = await page.cookies();
console.log(JSON.stringify(cookie));
```

### 设置Cookie
``` 
var cookies = "文件读取出来的cookie";
var c = JSON.parse(cookies);
for (var i =0; i<c.length; i++){
	await page.setCookie(c[i]);
}
```

### 执行JS
```
await page.evaluate(async () => {
    Object.defineProperty(navigator, 'webdriver', { get: ()=> false });
});
```

### 过webdriver脚本 [_](https://github.com/kingname/stealth.min.js)
```
await page.evaluateOnNewDocument(脚本内容);
```

