#!/usr/bin/env python
# -*-coding:utf-8-*-
# by 'hollowman6' from Lanzhou University(兰州大学)

from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
from job import job_function
import os


sched = BlockingScheduler()
sched.add_job(job_function, CronTrigger.from_crontab(os.environ['CRONEXP']))
sched.start()
