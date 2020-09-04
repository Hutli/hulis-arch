#! /usr/bin/python3
import requests
#import pifacecad
import logging
import time
import sys
import socket
from decimal import *
from xml.etree import ElementTree
from systemd.journal import JournaldLogHandler

# get an instance of the logger object this module will use
logger = logging.getLogger(__name__)

# instantiate the JournaldLogHandler to hook into systemd
journald_handler = JournaldLogHandler()

# set a formatter to include the level name
journald_handler.setFormatter(logging.Formatter(
    '[%(levelname)s] %(message)s'
))

# add the journald handler to the current logger
logger.addHandler(journald_handler)

# optionally set the logging level
logger.setLevel(logging.DEBUG)

#cad = pifacecad.PiFaceCAD()
#cad.lcd.backlight_on()
#cad.lcd.blink_off()
#cad.lcd.cursor_off()

while True:
    hostname = socket.gethostname()
    localIp = socket.gethostbyname(hostname)

    hostNameStr = 'HN: ' + bytesToStr(hostname).rjust(12)
    localIpStr = 'IP: ' + bytesToStr(localIp).rjust(12)

    print(hostNameStr)
    print(localIpStr)

    logger.info(downloadPrintStr)
    logger.info(uploadPrintStr)

    #cad.lcd.write(downloadPrintStr + '\n' + uploadPrintStr)
    #cad.lcd.home()

    time.sleep(5)
