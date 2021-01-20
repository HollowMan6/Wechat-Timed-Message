# 使用Github Actions workflows向微信推送定时消息

[![last-commit](https://img.shields.io/github/last-commit/HollowMan6/Wechat-Timed-Message-Through-Actions)](../../graphs/commit-activity)
![Python package](../../workflows/Python%20package/badge.svg)

[![Followers](https://img.shields.io/github/followers/HollowMan6?style=social)](https://github.com/HollowMan6?tab=followers)
[![watchers](https://img.shields.io/github/watchers/HollowMan6/Wechat-Timed-Message-Through-Actions?style=social)](../../watchers)
[![stars](https://img.shields.io/github/stars/HollowMan6/Wechat-Timed-Message-Through-Actions?style=social)](../../stargazers)
[![forks](https://img.shields.io/github/forks/HollowMan6/Wechat-Timed-Message-Through-Actions?style=social)](../../network/members)

[![Open Source Love](https://img.shields.io/badge/-%E2%9D%A4%20Open%20Source-Green?style=flat-square&logo=Github&logoColor=white&link=https://hollowman6.github.io/fund.html)](https://hollowman6.github.io/fund.html)
[![GPL Licence](https://img.shields.io/badge/license-GPL-blue)](https://opensource.org/licenses/GPL-3.0/)
[![Repo-Size](https://img.shields.io/github/repo-size/HollowMan6/Wechat-Timed-Message-Through-Actions.svg)](../../archive/master.zip)

[![Total alerts](https://img.shields.io/lgtm/alerts/g/HollowMan6/Wechat-Timed-Message-Through-Actions.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/HollowMan6/Wechat-Timed-Message-Through-Actions/alerts/)
[![Language grade: Python](https://img.shields.io/lgtm/grade/python/g/HollowMan6/Wechat-Timed-Message-Through-Actions.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/HollowMan6/Wechat-Timed-Message-Through-Actions/context:python)

(English version is down below)

### 好用记得收藏(右上角**加星★Star**)哦!

[微信消息推送脚本](Wechat-Timed-Message-Through-Actions.py)

[工作流存放文件夹](.github/workflows)

## 使用方法

你需要fork本仓库，之后在你fork的仓库中创建相关Actions Secret并进行相关设置(按下图所示点击1，2，3的次序，即可进入新建Actions secrets的界面):

![](img/secrets.png)

你可以从以下三个推送平台中任选一个或多个来接受推送的消息：

### PushPlus(推荐)

[登录PushPlus](https://pushplus.hxtrip.com/login)，然后在pushplus网站中找到您的token，创建一个Name为`PPTOKEN`，value为您的token值的Actions secret，就可以进行一对一推送自动打卡结果相关信息。

如果需要对多个账号推送自动打卡结果相关信息，即一对多推送，还需要另外新建一个群组，记下群组编码，然后创建一个Name为`PPTOPIC`，value为您的群组编码的Actions secret。

![](https://pushplus.hxtrip.com/doc/img/c1.png)

### Server酱

如使用[Server酱](http://sc.ftqq.com/)来实现，它的配置方法请参考其说明文档。

然后，你只需要创建一个Name为`SERVERCHANSCKEY`，value为[你的SCKEY调用代码值](http://sc.ftqq.com/?c=code)的Actions secret即可自动让仓库的工作流通过Server酱为你推送自动打卡结果相关信息。

*效果示意*：

推送效果：
![](img/ServerChan.jpg)

点开详情：
![](img/ServerChanMessage.jpg)

### Server酱测试号版

如果要使用[Server酱测试号版](https://sct.ftqq.com/)，请创建一个/修改Name为`SERVERCHANSCKEY`，value为[你的SendKey值](https://sct.ftqq.com/sendkey)的Actions secret。另外创建一个Name为`OPENID`的Actions secret，如果value值为`0`则是通过公众号仅发给自己。否则将value值设定为关注你测试公众号的那个用户的微信号openid，这时将发给自己的同时还会发送给那个指定用户。

如果需要转换回普通的Sever酱请将`OPENID` Actions secret删除即可。

---

上述配置成功后，配置工作流文件，以[工作流1.yml](.github/workflows/1.yml)为模板，创建你自己的工作流或者在提供的工作流上进行修改。你可以任意更改name为无空格的英文字母和数字组合的字符串，cron为你想要发送消息的指定时间(你可以使用[crontab guru](https://crontab.guru/)进行cron表达式的调试，所有时间均为UTC时间，请进行时区换算)(因为Github方的原因，预定运行时间可能会有半小时左右的延迟)。然后创建一个或者两个Actions secrets，一个必须创建，其name为`TITLE[name]`（请将这里的`[name]`修改为workflow的name），value为要发送消息的标题，例如在提供的工作流中，这里的name为`TITLE1`；另一个为可选的，其name为`MSG[name]`，同理进行相应的替换，value为要发送消息的标题。这里消息的内容请不要包含换行或者特殊控制字符。

随后，按下图所示点击1，2，3，4的次序，你可以手动触发工作流的执行来进行测试。
   
![](img/workflow.png)

点开任意一个运行记录，依次点开下图所示1，2，你可以看到运行记录。

![](img/run.png)

如果某次因为某些因素工作流运行失败，GitHub会自动发邮件提醒工作流运行失败。

**警告**：

***仅供测试使用，不可用于任何非法用途！***

***对于使用本代码所造成的一切不良后果，本人将不负任何责任！***
