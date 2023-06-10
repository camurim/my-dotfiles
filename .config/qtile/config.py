# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import (
    Click,
    Drag,
    Group,
    KeyChord,
    Key,
    Match,
    Screen,
    ScratchPad,
    DropDown,
)
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401

from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration

mod = "mod4"
myTerm = "kitty"  # My terminal of choice
myBrowser = "brave-browser"  # My browser of choice
myWallpaper = "~/.config/qtile/wallpaper6.jpg"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.grow_upnormalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(myTerm), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    ##
    ## Help
    ##
    Key(
        [mod],
        "r",
        lazy.spawn(
            "rofi -combi-modi window,drun,run,ssh -lines 15 -location 0 -show combi -run-shell-command 'kitty -e bash -ic \"{cmd} && read\"'"
        ),
        desc="Spawn a command using a prompt widget",
    ),
    ##
    ## Applications
    ##
    Key(["mod1"], "b", lazy.spawn(myBrowser), desc="Brave Browser"),
    Key(["mod1"], "f", lazy.spawn("nautilus"), desc="Nautilus File Manager"),
    Key(["mod1"], "c", lazy.spawn("emacs"), desc="Emacs"),
    Key(
        [mod],
        "F1",
        lazy.spawn(
            'zenity --info --text="SUPER + CTRL + R\t\tReload configurations\nSUPER + CTRL + q\t\tEnd Qtile\nSUPER + F2\t\t\tKeepass2\nSUPER + F3\t\t\tFile Manager\nSUPER + F4\t\t\tPerformance Monitor\nSUPER + F5\t\t\tQuicknotes\nSUPER + F6\t\t\tCalendar\nSUPER + F7\t\t\tCMUS\nSUPER + F8\t\t\tValume Control\nSUPER + F9\t\t\tRSS\nSUPER + F10\t\t\tChess\n" --title="Shortcuts" --width=400 --height=330'
        ),
        desc="Help",
    ),
    ##
    ## Bookmarks
    ##
    Key(
        [mod],
        "insert",
        lazy.spawn("%s%s" % (os.path.expanduser("~"), "/.local/bin/add-snippet")),
        desc="Bookmark this",
    ),
    Key(
        [mod],
        "home",
        lazy.spawn("%s%s" % (os.path.expanduser("~"), "/.local/bin/show-snipets")),
        desc="Show Bookmark",
    ),
    ##
    ## Lock Screen
    ##
    Key(
        [mod, "mod1"],
        "l",
        lazy.spawn("gnome-screensaver-command -l"),
        desc="Lock Screen",
    ),
    ##
    ## Take Screenshots
    ##
    Key(
        [],
        "Print",
        lazy.spawn(
            "scrot '/home/carlos/Imagens/captures/%Y-%m-%d_$wx$h.png' -e 'xclip -selection clipboard -t image/png $f'"
        ),
        desc="Full screen screenshot",
    ),
    Key(
        ["mod1"],
        "Print",
        lazy.spawn("flameshot gui -p '/home/carlos/Imagens/captures/'"),
        desc="Select area screenshot",
    ),
]

# groups = [Group(i) for i in "123456789"]
groups = [
    Group(
        "WWW",
        layout="monadtall",
        matches=[Match(wm_class=["Firefox"]), Match(wm_class=["Brave-browser"])],
    ),  # Browsers
    Group("TER", layout="monadtall"),  # Terminals
    Group(
        "OBS", layout="monadtall", matches=[Match(wm_class=["obsidian"])]
    ),  # Obsidian
    Group(
        "DEV",
        layout="treetab",
        matches=[
            Match(wm_class=["emacs"]),
            Match(wm_class=["Eclipse"]),
            Match(wm_class=["DBeaver"]),
        ],
    ),  # Development
    Group(
        "FSYS",
        layout="monadtall",
        matches=[
            Match(wm_class=["org.gnome.Nautilus"]),
            Match(wm_class=["dolphin"]),
        ],
    ),  # File SystemExit
    Group("FTP", layout="monadtall", matches=[Match(wm_class=["filezilla"])]),  # FTP
    Group(
        "TXT",
        layout="treetab",
        matches=[
            Match(wm_class=["libreoffice"]),
            Match(wm_class=["okular"]),
        ],
    ),  # Text Editor
    Group("SSH", layout="treetab"),  # SSH Session 1
    Group(
        "MISC1",
        layout="max",
        matches=[
            Match(wm_class=["pritunl"]),
        ],
    ),  # Miscelaneous 1
    Group(
        "MISC2",
        layout="max",
        matches=[
            Match(wm_class=["Steam"]),
        ],
    ),  # Miscelaneos 2
]

##
## ScratchPads
##

dropdown_conf = {
    "opacity": 1,
    "warp_pointer": False,
    "height": 0.45,
}

groups.append(
    ScratchPad(
        "sp",
        [
            DropDown("Term", myTerm, **dropdown_conf),
            DropDown("Emacs", "emacs", **dropdown_conf),
            DropDown("KeepPass", "keepassxc", **dropdown_conf),
            DropDown("Nautilus", "nautilus", **dropdown_conf),
            DropDown(
                "Perfmon",
                f"{myTerm} -e btop",
                opacity=1,
                warp_pointer=False,
                height=0.70,
            ),
            DropDown("Cmus", f"{myTerm} -e cmus", **dropdown_conf),
            DropDown(
                "Quicknote",
                'ghostwriter "%s/google-drive/obsidian_vaults/principal/03 - Others/Quicknote.md"'
                % (os.path.expanduser("~")),
                **dropdown_conf,
            ),
            DropDown("Rss", f"{myTerm} -e newsboat", **dropdown_conf),
            DropDown("Volume", f"{myTerm} pulsemixer", **dropdown_conf),
            DropDown("Calendar", f"{myTerm} -e calcurse", **dropdown_conf),
            DropDown(
                "GnomeChess",
                "gnome-chess",
                opacity=1,
                warp_pointer=False,
                height=0.80,
                width=0.40,
            ),
        ],
    )
)

keys.extend(
    [
        Key(["control"], "apostrophe", lazy.group["sp"].dropdown_toggle("Term")),
        Key([mod], "c", lazy.group["sp"].dropdown_toggle("GnomeChess")),
        Key([mod], "z", lazy.group["sp"].dropdown_toggle("Emacs")),
        Key([mod], "F2", lazy.group["sp"].dropdown_toggle("KeepPass")),
        Key([mod], "F3", lazy.group["sp"].dropdown_toggle("Nautilus")),
        Key([mod], "F4", lazy.group["sp"].dropdown_toggle("Perfmon")),
        Key([mod], "F5", lazy.group["sp"].dropdown_toggle("Quicknote")),
        Key([mod], "F6", lazy.group["sp"].dropdown_toggle("Calendar")),
        Key([mod], "F7", lazy.group["sp"].dropdown_toggle("Cmus")),
        Key([mod], "F8", lazy.group["sp"].dropdown_toggle("Volume")),
        Key([mod], "F9", lazy.group["sp"].dropdown_toggle("Rss")),
    ]
)

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group
from libqtile.dgroups import simple_key_binder

dgroups_key_binder = simple_key_binder("mod4")


##
## Layouts
##

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": "e1acff",
    "border_normal": "1D2330",
}

layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(shift_windows=True, **layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.TreeTab(
        font="Ubuntu",
        fontsize=10,
        sections=["FIRST", "SECOND", "THIRD", "FOURTH"],
        section_fontsize=10,
        border_width=2,
        bg_color="1c1f24",
        active_bg="c678dd",
        active_fg="000000",
        inactive_bg="a9a1e1",
        inactive_fg="1c1f24",
        padding_left=0,
        padding_x=0,
        padding_y=5,
        section_top=10,
        section_bottom=20,
        level_shift=8,
        vspace=3,
        panel_width=200,
    ),
    layout.Floating(**layout_theme),
]

colors = [
    ["#282c34", "#282c34"],
    ["#1c1f24", "#1c1f24"],
    ["#dfdfdf", "#dfdfdf"],
    ["#ff6c6b", "#ff6c6b"],
    ["#98be65", "#98be65"],
    ["#da8548", "#da8548"],
    ["#51afef", "#51afef"],
    ["#c678dd", "#c678dd"],
    ["#46d9ff", "#46d9ff"],
    ["#a9a1e1", "#a9a1e1"],
]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(font="Ubuntu Bold", fontsize=10, padding=2, background=colors[2])
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.Sep(linewidth=0, padding=6, foreground=colors[2], background=colors[0]),
        widget.Image(
            filename="~/.config/qtile/icons/python-white.png",
            scale="False",
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(myTerm)},
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[2], background=colors[0]),
        widget.GroupBox(
            font="Ubuntu Bold",
            fontsize=9,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=3,
            borderwidth=3,
            active=colors[2],
            inactive=colors[7],
            rounded=False,
            highlight_color=colors[1],
            highlight_method="line",
            this_current_screen_border=colors[6],
            this_screen_border=colors[4],
            other_current_screen_border=colors[6],
            other_screen_border=colors[4],
            foreground=colors[2],
            background=colors[0],
        ),
        widget.TextBox(
            text="|",
            font="Ubuntu Mono",
            background=colors[0],
            foreground="474747",
            padding=2,
            fontsize=14,
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[2],
            background=colors[0],
            padding=0,
            scale=0.7,
        ),
        widget.CurrentLayout(foreground=colors[2], background=colors[0], padding=5),
        widget.TextBox(
            text="|",
            font="Ubuntu Mono",
            background=colors[0],
            foreground="474747",
            padding=2,
            fontsize=14,
        ),
        widget.WindowName(foreground=colors[6], background=colors[0], padding=0),
        widget.Systray(background=colors[0], padding=5),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
        widget.Net(
            interface="enp1s0",
            format="Net: {down} ↓↑ {up}",
            foreground=colors[3],
            background=colors[0],
            padding=5,
            decorations=[
                BorderDecoration(
                    colour=colors[3],
                    border_width=[0, 0, 2, 0],
                    padding_x=5,
                    padding_y=None,
                )
            ],
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
        widget.ThermalSensor(
            foreground=colors[4],
            background=colors[0],
            threshold=90,
            fmt="Temp: {}",
            padding=5,
            decorations=[
                BorderDecoration(
                    colour=colors[4],
                    border_width=[0, 0, 2, 0],
                    padding_x=5,
                    padding_y=None,
                )
            ],
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
        widget.CheckUpdates(
            update_interval=1800,
            distro="Debian",
            display_format="Updates: {updates} ",
            foreground=colors[5],
            colour_have_updates=colors[5],
            colour_no_updates=colors[5],
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(
                    myTerm + " -e sudo apt-get upgrade -y"
                )
            },
            padding=5,
            background=colors[0],
            decorations=[
                BorderDecoration(
                    colour=colors[5],
                    border_width=[0, 0, 2, 0],
                    padding_x=5,
                    padding_y=None,
                )
            ],
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
        widget.Memory(
            foreground=colors[9],
            background=colors[0],
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(myTerm + " -e htop")},
            fmt="Mem: {}",
            measure_mem="G",
            measure_swap="G",
            padding=5,
            decorations=[
                BorderDecoration(
                    colour=colors[9],
                    border_width=[0, 0, 2, 0],
                    padding_x=5,
                    padding_y=None,
                )
            ],
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
        widget.Volume(
            foreground=colors[7],
            background=colors[0],
            fmt="Vol: {}",
            padding=5,
            decorations=[
                BorderDecoration(
                    colour=colors[7],
                    border_width=[0, 0, 2, 0],
                    padding_x=5,
                    padding_y=None,
                )
            ],
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
        widget.Battery(
            format="Bat: {percent:2.0%}",
            update_interval=5,
            low_percentage=0.10,
            unknown_char="",
            full_char="",
            charge_char="+",
            discharge_char="-",
            empty_char="",
            background=colors[0],
            foreground=colors[8],
            low_foreground=colors[3],
            decorations=[
                BorderDecoration(
                    colour=colors[8],
                    border_width=[0, 0, 2, 0],
                    padding_x=5,
                    padding_y=None,
                )
            ],
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
        widget.Clock(
            foreground=colors[6],
            background=colors[0],
            format="%A, %d de %B - %H:%M ",
            decorations=[
                BorderDecoration(
                    colour=colors[6],
                    border_width=[0, 0, 2, 0],
                    padding_x=5,
                    padding_y=None,
                )
            ],
        ),
        widget.Sep(linewidth=0, padding=6, foreground=colors[0], background=colors[0]),
    ]
    return widgets_list


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    # del widgets_screen1[
    #    9:10
    # ]  # Slicing removes unwanted widgets (systray) on Monitors 1,3
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2  # Monitor 2 will display all widgets in widgets_list


def init_screens():
    return [
        Screen(
            wallpaper=myWallpaper,
            wallpaper_mode="stretch",
            top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20),
        ),
        Screen(
            wallpaper=myWallpaper,
            wallpaper_mode="stretch",
            top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20),
        ),
        Screen(
            wallpaper=myWallpaper,
            wallpaper_mode="stretch",
            top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20),
        ),
    ]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        # default_float_rules include: utility, notification, toolbar, splash, dialog,
        # file_progress, confirm, download and error.
        *layout.Floating.default_float_rules,
        Match(title="Confirmation"),  # tastyworks exit box
        Match(title="Qalculate!"),  # qalculate-gtk
        Match(wm_class="kdenlive"),  # kdenlive
        Match(wm_class="pinentry-gtk-2"),  # GPG key password entry
        Match(wm_class="KeePass2"),  # KeePass2 password manager
        Match(wm_class="pritunl"),  # Pritunl VPN Client
        Match(wm_class="gcolor3"),  # Gnome Color Picker
        Match(wm_class="feh"),  # Gnome Color Picker
        Match(wm_class="scrcpy"),  # Screen Copy
        Match(wm_class="gnome-chess"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
