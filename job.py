#!/usr/bin/env python
# -*-coding:utf-8-*-
# by 'hollowman6' from Lanzhou University(兰州大学)

import os


def job_function():
    failure = False
    if os.system("python Wechat-Timed-Message.py") != 0:
        failure = True
    delays = os.environ['DELAYS']
    if failure and delays:
        os.system("echo 'Sleep for " + delays +
                  " and the message will be sent again!'")
        os.system("echo Sleep for " + delays +
                  " and the message will be sent again! >> logs.txt")
        os.system("sleep " + delays)
        job_function()


if __name__ == "__main__":
    job_function()
