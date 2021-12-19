# [Tricks](https://puffhub.github.io/Crack/Android-Crack/)

**一行命令dump页面元素**

```java
adb shell uiautomator dump \
--compressed /data/local/tmp/uidump.xml && \
adb pull /data/local/tmp/uidump.xml && \
cat uidump.xml | xmllint --format - | tee dump.xml && \
gedit dump.xml
```

<br />
**MIUI历史版本下载地址:** [https://roms.miuier.com/](https://roms.miuier.com/)