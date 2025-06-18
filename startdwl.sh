#!/bin/sh
slstatus -s | dwl -s "exec dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & 
lxpolkit &"
