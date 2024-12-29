#!/bin/bash
set -e

DL="https://github.com/LukeYui/EldenRingSeamlessCoopRelease/releases/download/v1.8.9/ersc.zip"
if ! [[ -f ersc.zip ]];
then
    curl -LO $DL
fi
unzip ersc.zip
#root1="/run/media/deck/f8d2b409-4d8e-437b-8365-ca72f582c508/steamapps/common/ELDEN RING"
GAME_DIR="$(find / -type d -name 'ELDEN RING' -path '*/common/*' -readable -print -quit 2>/dev/null || true)"
echo "Detected GAME_DIR: $GAME_DIR"
LAUNCHER_TARGET="$GAME_DIR/Game/ersc_launcher.exe"
FOLDER_TARGET="$GAME_DIR/Game/SeamlessCoop"
if [[ -f "$LAUNCHER_TARGET" ]]
then
    rm "$LAUNCHER_TARGET"
fi
if [[ -d "$FOLDER_TARGET" ]]
then
    rm -r "$FOLDER_TARGET"
fi
mv ersc_launcher.exe "$LAUNCHER_TARGET"
mv SeamlessCoop "$FOLDER_TARGET"
cp ersc_settings.ini "${FOLDER_TARGET}/"
echo "Add non-steam game: $LAUNCHER_TARGET"
echo "Use Proton-up to install ProtonGE and select a good version for ERSC"
echo "GE-Proton9-2 has worked"
