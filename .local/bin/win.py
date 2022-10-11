#!/usr/bin/env python3
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, GObject, Pango
from threading import Thread
import subprocess
import time
import signal
import sys
import os

# --- set the color (index) below (1 is the first)
color = 1
# ---
textcolors = ["grey", "orange", "green", "blue", "white"]
# --- don't change anything below
txtcolor = textcolors[color-1]

countdown = int(sys.argv[1])
susp = os.path.dirname(os.path.realpath(__file__))+"/susp.sh"

class CountDown(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self)
        maingrid = Gtk.Grid()
        self.add(maingrid)
        maingrid.set_border_width(40)
        # set initial text for the spash window
        self.label = Gtk.Label(convert_seconds(countdown))
        self.label.modify_font(Pango.FontDescription('Ubuntu 22'))
        self.label.set_width_chars(10) 
        maingrid.attach(self.label, 0, 0, 1, 1)
        self.update = Thread(target=self.start_countdown, args=[countdown])
        # daemonize the thread
        self.update.setDaemon(True)
        self.update.start()

    def start_countdown(self, countdown):
        t = countdown
        while t > 0:
            time.sleep(1)
            t -= 1
            GObject.idle_add(self.label.set_text, convert_seconds(t),
                priority=GObject.PRIORITY_DEFAULT)
            #print(t)
        #subprocess.Popen(["/bin/bash", susp])
        self.stop()

    def stop(self):
        Gtk.main_quit()

def get_screen():
    scr = [s.split("x") for s in subprocess.check_output([
        "xrandr"]).decode("utf-8").split() if "+0+0" in s][0]
    return int(scr[0]) - 300

def convert_seconds(sec):
    timedisplay = [
        str(int(sec/3600)),
        str(int((sec % 3600)/60)),
        str(int(sec % 60)),
        ]
    for i, n in enumerate(timedisplay):
        if len(n) == 1:
            timedisplay[i] = "0"+n
    return ":".join(timedisplay)

def splashwindow():
    window = CountDown()
    window.set_decorated(False)
    window.set_resizable(False)
    window.override_background_color(Gtk.StateType.NORMAL, Gdk.RGBA(0,0,0,1))
    window.modify_fg(Gtk.StateFlags.NORMAL, Gdk.color_parse(txtcolor))
    window.set_opacity(0.6)
    window.move(get_screen(), 80)
    window.set_keep_above(True)
    window.show_all()
    Gtk.main()

GObject.threads_init()
splashwindow()
