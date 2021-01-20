#!/usr/bin/env python
# -*-coding:utf-8-*-
# by 'hollowman6' from Lanzhou University(兰州大学)

import os
import urllib.request
import json
import urllib.parse

sckey = os.environ['SERVERCHANSCKEY']
openid = os.environ['OPENID']
pptoken = os.environ['PPTOKEN']
pptopic = os.environ['PPTOPIC']
title = os.environ['TITLE']
message = os.environ['MSG']
errorServerChan = ""

if not title:
    raise Exception("未设置 `TITLE[name]` Actions Secret!")

if sckey:
    host = "https://sc.ftqq.com/"
    user = ""
    if openid:
        host = "https://sctapi.ftqq.com/"
        if openid != "0":
            user = "&openid=" + openid
    res = urllib.request.urlopen(host + sckey + ".send?text=" + title +
                        "&desp=" + message.replace('\r', '').replace('\n', '\n\n') + user)
    result = json.loads(res.read().decode('utf-8'))
    if not openid and result['errno'] == 0:
        print("成功通过Sever酱将结果通知给用户!")
    elif openid and result['data']['errno'] == 0:
        if openid == "0":
            print("成功通过Sever酱将结果通知到测试公众号的创建用户!")
        else:
            print("成功通过Sever酱将结果通知到测试公众号的指定关注用户和创建用户!")
    else:
        errorServerChan = "Server酱推送错误: " + res.read().decode('utf-8')
else:
    print("未设置SERVERCHANSCKEY，尝试使用PushPlus...")

if pptoken:
    host = "http://pushplus.hxtrip.com/"
    user = ""
    if not message:
        message = title
        title = ""
    res = urllib.request.urlopen(host + "send?token=" + pptoken + "&title=" + title +
                        "&content=" + message.replace('\r', '').replace('\n', '<br>') + "&template=html&topic=" + pptopic)
    result = json.loads(res.read().decode('utf-8'))
    if result['code'] == 200:
        print("成功通过PushPlus将结果通知给相关用户!")
    else:
        raise Exception("PushPlus推送错误: " + res.read().decode('utf-8') +
                        "\n" + errorServerChan)
else:
    print("未设置PPTOKEN！")

if errorServerChan:
    raise Exception(errorServerChan)
