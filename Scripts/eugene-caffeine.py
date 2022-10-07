#!/usr/bin/env python3

from subprocess import call,check_output
from time import sleep

def main():
    dontspam=0
    while True:
        sleep(60)
        winlist = check_output('DISPLAY=:0 wmctrl -l', shell = True)
        if 'Netflix' in str(winlist) or 'YouTube' in str(winlist) or 'pdfpc' in str(winlist) or 'Minecraft' in str(winlist):
            if dontspam == 0:
                print('...watching videos, disabling xautolock')
                call(["xautolock", "-disable"])
                #call(["xset", "s off -dpms"])
                # comment out next line if not using awesomewm
                #call("""awesome-client 'cafficon.image = "/home/spleenftw/.icons/my-caffeine-on-symbolic.png"'""", shell = True)
                dontspam=1
            else:
                pass
        else:
            if dontspam == 1:
                print('...not watching videos, enabling xautolock')
                call(["xautolock", "-enable"])
                #call(["xset", "s on dpms"])
                # comment out next line if not using awesomewm
                #call("""awesome-client 'cafficon.image = "/home/spleenftw/.icons/my-caffeine-off-symbolic.png"'""", shell = True)
                dontspam=0
            else:
                pass

main()
