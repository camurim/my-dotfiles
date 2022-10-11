#!/usr/bin/env python3
import subprocess
import time
import os
import sys

window_mod = os.path.dirname(os.path.realpath(__file__))+"/win.py" 

suspend = int(sys.argv[1])
countdown = int(sys.argv[2])

w = False
while True:  
    time.sleep(1)
    idletime = int(subprocess.check_output(
        "xprintidle"
        ).decode("utf-8").strip())/1000
    if all([idletime > suspend-countdown, w == False]):
        subprocess.Popen(["python3", window_mod, str(countdown)])
        w = True
    elif all([idletime < suspend-countdown, w == True]):
        try:
            procdata = subprocess.check_output([
                "pgrep", "-f", window_mod
                ]).decode("utf-8").strip()
            procs = procdata.splitlines()
        except subprocess.CalledProcessError:
            pass
        else:
            for p in procs:
                subprocess.Popen(["kill", p])
        w = False
