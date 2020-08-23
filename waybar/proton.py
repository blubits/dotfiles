#!/bin/python
import subprocess
from time import sleep
import json
import sys

while True:
    r = subprocess.run(["protonvpn", "status"], stdout=subprocess.PIPE)
    s = [[y for y in x.split(" ") if y] for x in r.stdout.decode('utf-8').split("\n")]
    d = {
        "text": "  " + s[3][1] if s[0][1] == "Connected" else "",
        "tooltip": s[2][1] if s[0][1] == "Connected" else "disconnected",
        "class": "vpn-connected" if s[0][1] == "Connected" else "vpn-disconnected"
    }
    print(json.dumps(d))
    sys.stdout.flush()
    sleep(1)