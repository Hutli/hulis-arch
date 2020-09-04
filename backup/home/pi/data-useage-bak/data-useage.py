#! /usr/bin/python3
import requests
import pifacecad
import logging
import time
import sys
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

cad = pifacecad.PiFaceCAD()
cad.lcd.backlight_on()
cad.lcd.blink_off()
cad.lcd.cursor_off()

def bytesToStr(totalBytes):
    oneKiloByte = 1024
    oneMegaByte = oneKiloByte * 1024
    oneGigaByte = oneMegaByte * 1024

    q = Decimal(10) ** -2

    if totalBytes > oneGigaByte:
        return str(Decimal(totalBytes / oneGigaByte).quantize(q)) + " GB"
    elif totalBytes > oneMegaByte:
        return str(Decimal(totalBytes / oneMegaByte).quantize(q)) + " MB"
    elif totalBytes > oneKiloByte:
        return str(Decimal(totalBytes / oneKiloByte).quantize(q)) + " KB"
    else:
        return str(totalBytes) + " B"

while True:
    try:
        response = requests.get('https://192.168.8.1/api/monitoring/traffic-statistics', verify=False)

        tree = ElementTree.fromstring(response.content)
        currentDownload = 0
        currentUpload = 0
        for elem in tree:
            if(elem.tag == "CurrentDownload"):
                currentDownload = int(elem.text)
            if(elem.tag == "CurrentUpload"):
                currentUpload = int(elem.text)

        downloadPrintStr = 'Down: ' + bytesToStr(currentDownload).rjust(10)
        uploadPrintStr = 'Up: ' + bytesToStr(currentUpload).rjust(12)

        print(downloadPrintStr)
        print(uploadPrintStr)

        logger.info(downloadPrintStr)
        logger.info(uploadPrintStr)

        cad.lcd.write(downloadPrintStr + '\n' + uploadPrintStr)
        cad.lcd.home()

        time.sleep(5)

        #raise OSError("Connection Error")

    except OSError as e:
        if str(e) == "('Connection aborted.', OSError(0, 'Error'))":
            for i in reversed(range(60)):
                errorStr = f'OS Connect Error\nReconnecting {i}s'
                cad.lcd.home()
                cad.lcd.write(errorStr)
                print(errorStr)
                logger.error(errorStr)
                time.sleep(1)
        else:
            cad.lcd.clear()

            errorStr = f'{e}'
            cad.lcd.write(errorStr.replace(errorStr[16:], '\n' + errorStr[16:]))
            print(errorStr)
            logger.error(errorStr)
            exit(1)
