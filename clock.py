#!/usr/bin/env python
# -*-coding:utf-8-*-
# by 'hollowman6' from Lanzhou University(兰州大学)

from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
import os


def job_function():
    failure = False
    if os.system("python Wechat-Timed-Message.py >> logs.txt") != 0:
        failure = True
    delays = os.environ['DELAYS']
    if failure and delays:
        os.system("echo Sleep for " + delays +
                  " and the message will be sent again!")
        os.system("echo Sleep for " + delays +
                  " and the message will be sent again! >> logs.txt")
        os.system("timeout " + delays)
        job_function()


sched = BlockingScheduler()
sched.add_job(job_function, CronTrigger.from_crontab(os.environ['CRONEXP']))
sched.start()
