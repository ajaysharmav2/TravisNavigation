#!/bin/sh

#  sign-and-upload.sh
#  XcodeTravis
#
#  Created by Ajay Sharma on 12/10/14.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#  http://www.objc.io/issue-6/travis-ci.html

#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
echo "This is a pull request. No deployment will be done."
exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
echo "Testing on a branch other than master. No deployment will be done."
exit 0
fi

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
RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER\nUploaded: $RELEASE_DATE"



echo "Global Variable - 1"
ALL_NOTES=`cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] | {name: .name, id: .id}'`

echo $ALL_NOTES

# Get the release notes
#- ./scripts/Get_All_Pivotal_Comments.sh
#sh ./scripts/Get_All_Pivotal_Comments.sh

#if [ ! -z "$TESTFLIGHT_TEAM_TOKEN" ] && [ ! -z "$TESTFLIGHT_API_TOKEN" ]; then
#  echo ""
#  echo "***************************"
#  echo "* Uploading to Testflight *"
#  echo "***************************"
#  curl http://testflightapp.com/api/builds.json \
#    -F file="@$OUTPUTDIR/$APP_NAME.ipa" \
#    -F dsym="@$OUTPUTDIR/$APP_NAME.app.dSYM.zip" \
#    -F api_token="$TESTFLIGHT_API_TOKEN" \
#    -F team_token="$TESTFLIGHT_TEAM_TOKEN" \
#    -F distribution_lists='Internal' \
#    -F notes="$RELEASE_NOTES"
# echo "Upload finished"
#fi

HOCKEY_APP_ID="a3cd182b137aed43d6f092c0b259544a"
HOCKEY_APP_TOKEN="759fb41a1d2e440e98d10d0cb022cbe2"
echo "*        Testing for HockeyApp          *"

#if [ ! -z "$HOCKEY_APP_ID" ] && [ ! -z "$HOCKEY_APP_TOKEN" ]; then
#echo ""
#echo "***************************"
#echo "* Uploading to Hockeyapp  *"
#echo "***************************"
#curl  \
#-F "status=2" \
#-F "notify=0" \
#-F "notes=$RELEASE_NOTES" \
#-F "notes_type=0" \
#-F "ipa=@$OUTPUTDIR/$APP_NAME.ipa" \
#-F "dsym=@$OUTPUTDIR/$APP_NAME.app.dsym.zip" \
#-H "X-HockeyAppToken: $HOCKEY_APP_TOKEN" \
#https://rink.hockeyapp.net/api/2/apps/upload
#echo "Upload finish"
#fi

#{"title":"Travis Test","bundle_identifier":"com.travis.travisnavigation","public_identifier":"a3cd182b137aed43d6f092c0b259544a","platform":"iOS","release_type":0,"custom_release_type":null,"created_at":"2015-03-02T09:11:57Z","updated_at":"2015-03-09T14:48:23Z","featured":false,"id":150444,"config_url":"https://rink.hockeyapp.net/manage/apps/150444/app_versions/2","public_url":"https://rink.hockeyapp.net/apps/a3cd182b137aed43d6f092c0b259544a","minimum_os_version":"7.0","device_family":"iPhone/iPod","status":2,"owner":"Backup Data","owner_token":"368b1383c024a45f61476ee1371b26494137c339"}

#PERSONAL_API_KEY="6c1b9810a91801321dcc22000ac44c54"

#echo "Global Variable - 1"
#$ALL_NOTES=`cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] | {name: .name, id: .id}'`
#
#MYNOTE=`cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] | {name: .name, id: .id}'`

#RELEASE_TITLE="UberTestersDemo4.0"
#
#
echo "***************************"
echo "* Uploading to UberTesters  *"
echo $ALL_NOTES
echo "***************************"
echo ALL_NOTES

curl  http://beta.ubertesters.com/api/client/upload_build.json \
-F file="@$OUTPUTDIR/$APP_NAME.ipa" \
-F title="$RELEASE_TITLE" \
-F notes="$ALL_NOTES" \
-F status="in_progress" \
-F stop_previous="true" \
-H "X-UbertestersApiKey:$PERSONAL_API_KEY" \

echo "*****  Upload finish *****"


# Script for Getting All Comments
#- ./scripts/Get_All_Pivotal_Comments.sh



#echo "***************************"
#echo "* Uploading to UberTesters  *"
#echo "***************************"
#curl http://beta.ubertesters.com/api/client/upload_build.json \
#-F file="@$OUTPUTDIR/$APP_NAME.ipa" \
#-H "X-UbertestersApiKey:$PERSONAL_API_KEY" \
#echo "Upload finish"
#{"success":true,"revision":{"platform":"iOS","application_id":"com.travis.travisnavigation","build_number":"2.0","created_at":"2015-03-10T09:31:14Z","title":"UberTestersDemo2.0","notes":"Build: 29\\nUploaded: 2015-03-10 09:22:00","size":1986804,"sdk_version":70,"min_os_version":"7.0","target_os_version":null,"project":"V2Demo Ubertesters / DemoUbertesters","status":"In progress","started_at":"2015-03-10T09:31:14Z","notify":true,"distribution_groups":[],"stop_previous":true}}Upload finish


