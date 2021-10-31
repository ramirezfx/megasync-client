#!/bin/bash

IMGNAME=mega.png
DESKTOPFILE=megasync.desktop

APPPATH=$(kdialog --getopenfilename)

sed -i 's?Exec=megasync?Exec='"$APPPATH"' --appimage-extract-and-run?g' $DESKTOPFILE

sudo mv $DESKTOPFILE /usr/share/applications
sudo cp $IMGNAME /usr/share/icons
