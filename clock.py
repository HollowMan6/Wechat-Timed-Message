#!/usr/bin/env python
# -*-coding:utf-8-*-
# by 'hollowman6' from Lanzhou University(兰州大学)

from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
import os


def job_function():
    failure = False
    if os.system("python Wechat-Timed-Message.py") != 0:
        failure = True
    delays = os.environ['DELAYS']
    os.system("rm information.txt")
    if failure and delays:
        os.system("echo 'Sleep for " + delays +
                  " and the message will be sent again!'")
        os.system("sleep " + delays)
        job_function()


sched = BlockingScheduler()
sched.add_job(job_function, CronTrigger.from_crontab(os.environ['CRONEXP']))
sched.start()
