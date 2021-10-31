#!/bin/bash
# DIST=$(cat /etc/os-release | grep VERSION_CODENAME | cut -d '=' -f 2)
DIST=hirsute
# VERSION=$(cat /etc/os-release | grep VERSION_ID | cut -d '"' -f 2)
VERSION=21.04
BASEURL=https://mega.nz/linux/MEGAsync/xUbuntu_$VERSION/amd64/
FILENAME=$(wget $BASEURL -q -O - | grep \>megasync_ | grep -v changelog | cut -d '"' -f8)
wget -O megasync-client-latest.deb $BASEURL$FILENAME
WORKDIR=megasync
rm -Rf $WORKDIR
rm megasync.yml
rm pkg2appimage-1807-x86_64.AppImage
# rm megasync_4.5.3-2.1_amd64.deb
cp megasync.yml.template megasync.yml
sed -i "s/DIST/$DIST/g" "megasync.yml"
wget https://github.com/AppImage/pkg2appimage/releases/download/continuous/pkg2appimage-1807-x86_64.AppImage
chmod 700 pkg2appimage-1807-x86_64.AppImage
./pkg2appimage-1807-x86_64.AppImage megasync.yml
cp megasync/megasync.AppDir/usr/share/applications/megasync.desktop .
cp megasync/megasync.AppDir/usr/share/icons/hicolor/256x256/apps/mega.png .
