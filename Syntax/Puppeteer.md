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

<br />
<details>
<summary>**过极验滑块**</summary>

```
async function slider() {
  try{
    await page.waitForSelector(".geetest_ready",{ timeout: 10000});
  }catch(e){
    return;
  }
  // 等待canvas完成 并完成0.5s的移动动画 (验证出错也可为等待时间)
  await page.waitForSelector('.geetest_ready', {
    timeout: 0,
  });
  await page.waitForTimeout(500);
  // 获取canvas的左上角X坐标作为滑动的基坐标
  await page.waitForSelector('.geetest_canvas_bg');
  let canvasCoordinate = await page.$('.geetest_canvas_bg');
  let canvasBox = await canvasCoordinate.boundingBox();
  let canvasX = canvasBox.x;
  // 等待滑动按钮出现获取Y坐标
  await page.waitForSelector('.geetest_slider_button');
  let button = await page.$('.geetest_slider_button');
  let box = await button.boundingBox();
  let mouseY = Math.floor(box.y + box.height / 2);
  // 计算位移
  let moveDistance = await compare();
  // 滑动验证
  await page.hover('.geetest_slider_button');
  await page.mouse.down();
  await page.mouse.move(canvasX + moveDistance / 3, mouseY, { steps: 15 });
  await page.waitForTimeout(1 * 30);
  await page.mouse.move(canvasX + moveDistance / 2, mouseY + 3, { steps: 20 });
  await page.waitForTimeout(2 * 50);
  await page.mouse.move(canvasX + moveDistance + 5, mouseY - 1, { steps: 18 });
  await page.waitForTimeout(3 * 20);
  await page.mouse.move(canvasX + moveDistance / 1, mouseY, { steps: 40 });
  await page.waitForTimeout(4 * 30);
  await page.mouse.up();
  // await page.waitForSelector('.geetest_success_radar_tip_content');
  // // 是否验证成功
  // let state = await page.evaluate(() => {
  //   return document.querySelector('.geetest_success_radar_tip_content').innerText;
  // });
  // if (state !== '验证成功') {
  //   return slider();
  // }
}
// 计算位移
async function compare() {
  //  获取canvas
  let moveDistance = await page.evaluate(() => {
    let fullbgs = document.querySelector('.geetest_canvas_fullbg');
    let bgs = document.querySelector('.geetest_canvas_bg');
    let bgsCtx = bgs.getContext('2d');
    let fullbgsCtx = fullbgs.getContext('2d');
    let canvasWidth = bgsCtx.canvas.width;
    let canvasHeight = bgsCtx.canvas.height;
    // 最大像素差(阀值)
    // let pixelsDifference = 100;
    let pixelsDifference = 60;
    // 第一个超过阀值的x坐标 最后一个超过阀值的x坐标
    let firstX, lastX;
    // 对比像素
    for (let i = 1, k = 1; i < canvasWidth; i++) {
      if (!firstX) {
        // 找到第一个超过阀值的X坐标后 Y轴停止循环
        for (let j = 1; j < canvasHeight; j++) {
          // 获取像素数据
          let bgsPx = bgsCtx.getImageData(i, j, 1, 1).data;
          let fullbgsPx = fullbgsCtx.getImageData(i, j, 1, 1).data;
          // 计算像素差 并判断是否超过阀值
          let res1 = Math.abs(bgsPx[0] - fullbgsPx[0]);
          let res2 = Math.abs(bgsPx[1] - fullbgsPx[1]);
          let res3 = Math.abs(bgsPx[2] - fullbgsPx[2]);
          if (res1 > pixelsDifference || res2 > pixelsDifference || res3 > pixelsDifference) {
            firstX = i;
            // 记录Y坐标
            k = j;
          }
        }
      } else {
        // 顺着X轴查找最后一个超过阀值的X坐标
        // K是第一个超过阀值的Y坐标
        // (会多一点循环时间 但是不用手动测量阴影块宽度)
        let bgsPx = bgsCtx.getImageData(i, k, 1, 1).data;
        let fullbgsPx = fullbgsCtx.getImageData(i, k, 1, 1).data;
        let res1 = Math.abs(bgsPx[0] - fullbgsPx[0]);
        let res2 = Math.abs(bgsPx[1] - fullbgsPx[1]);
        let res3 = Math.abs(bgsPx[2] - fullbgsPx[2]);
        if (res1 > pixelsDifference || res2 > pixelsDifference || res3 > pixelsDifference) {
          lastX = i;
        }
      }
    }
    // 滑动到阴影块中心的距离
    return firstX + (lastX - firstX) / 2;
  });
  return moveDistance;
}
```
</details>

<br />
<details>
<summary>**拦截请求**</summary>
[request.continue()参数](https://zhaoqize.github.io/puppeteer-api-zh_CN/#?product=Puppeteer&version=v13.0.0&show=api-requestcontinueoverrides)

```

const puppeteer = require('puppeteer');
(async () => {
  try {
    const browser = await puppeteer.launch({
      ignoreHTTPSErrors: true,
      headless: false,
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
    }).catch(() => browser.close);
    const page = await browser.newPage();
    await page.setRequestInterception(true);
    await page.on('request', request => {
      request.continue();
    });
    await page.goto('https://baidu.com');
    await page.screenshot({ path: 'news.png', fullPage: true });
    await browser.close();
  } catch (e) {
    console.log(e);
  }
})();
</details>