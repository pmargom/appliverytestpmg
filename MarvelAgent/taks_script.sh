#!/bin/bash

BASE_PATH="../../MarvelAgent-02"
APP_NAME="MarvelAgent"
PKG_NAME="MarvelAgent03"
TEAM_ID="UWCRT7HLJN"

clear

productbuild --component $BASE_PATH/"$APP_NAME".app /Applications/ $TEAM_ID $BASE_PATH/"$PKG_NAME".pkg

productbuild --component $BASE_PATH/"$APP_NAME".app --sign $TEAM_ID $BASE_PATH/"$PKG_NAME".pkg
