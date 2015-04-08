#!/bin/sh

#  sign-and-upload.sh
#  XcodeTravis
#
#  Created by Ajay Sharma on 12/10/14.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#  http://www.objc.io/issue-6/travis-ci.html

#!/bin/sh
#if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
#echo "This is a pull request. No deployment will be done."
#exit 0
#fi
#if [[ "$TRAVIS_BRANCH" != "master" ]]; then
#echo "Testing on a branch other than master. No deployment will be done."
#exit 0
#fi
#if [[ "$TRAVIS_BRANCH" != "QA" ]]; then
#echo "Testing on a branch other than master. No deployment will be done."
#exit 0
#fi

# Thanks @djacobs https://gist.github.com/djacobs/2411095
# Thanks @johanneswuerbach https://gist.github.com/johanneswuerbach/5559514

PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"
OUTPUTDIR="$PWD/build/Release-iphoneos"

echo "***************************"
echo "*        Signing          *"
echo "***************************"
xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/$APP_NAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"

zip -r -9 "$OUTPUTDIR/$APP_NAME.app.dsym.zip" "$OUTPUTDIR/$APP_NAME.app.dSYM"

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`



echo "Global Variable - 1"

ALL_NOTES=`cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] | .id, .name'`

echo $ALL_NOTES | awk -F '\n' '{print $1, $2}'

echo $ALL_NOTES

RELEASE_NOTES="$ALL_NOTES\nTravis Integration Build: $TRAVIS_BUILD_NUMBER"

#iOSDev Acc -
#3cfe66ad2f918e48a6dbb03ad4440683
#7ac0994985004cd59e94c89c397f5b2e


HOCKEY_APP_ID="3cfe66ad2f918e48a6dbb03ad4440683"
HOCKEY_APP_TOKEN="7ac0994985004cd59e94c89c397f5b2e"

#HOCKEY_APP_ID="a3cd182b137aed43d6f092c0b259544a"
#HOCKEY_APP_TOKEN="759fb41a1d2e440e98d10d0cb022cbe2"
echo "*        Testing for HockeyApp          *"

if [ ! -z "$HOCKEY_APP_ID" ] && [ ! -z "$HOCKEY_APP_TOKEN" ]; then
echo ""
echo "***************************"
echo "* Uploading to Hockeyapp  *"
echo "***************************"
curl  \
-F "status=2" \
-F "notify=0" \
-F "notes=$RELEASE_NOTES" \
-F "notes_type=0" \
-F "ipa=@$OUTPUTDIR/$APP_NAME.ipa" \
-F "dsym=@$OUTPUTDIR/$APP_NAME.app.dsym.zip" \
-H "X-HockeyAppToken: $HOCKEY_APP_TOKEN" \
https://rink.hockeyapp.net/api/2/apps/upload
echo "Upload finish"
fi





