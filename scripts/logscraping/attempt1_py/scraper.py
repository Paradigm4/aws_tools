#!/usr/bin/python

import sys
import datetime

with open(sys.argv[1]) as f:
  lines=f.read().splitlines()

firstTime=True
for line in lines:
  cur = datetime.datetime.strptime(line, '%H:%M:%S,%f')
  if firstTime:
    firstTime = False
    prev = cur
  diff = (cur - prev).total_seconds()
  print diff
  prev = cur

