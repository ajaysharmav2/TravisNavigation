#!/bin/sh

#  Get_All_Pivotal_Comments.sh
#
#
#  Created by Nitesh Meshram on 16/03/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#!/bin/sh



export PROJECT_ID=1114232
export TOKEN='cf9391f2af5a2b68da2755a27bce2bff'
#export LABEL_ID='b199'
export OUTPUT_FILE_NAME='jsonrespone.text'

export ALL_COMMENTS='allcomments.text'

echo "PATH info plist"
echo $PWD/$INFOPLIST_FILE

LABEL_ID=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$PWD/$INFOPLIST_FILE")
echo "MY App Version"
echo $LABEL_ID

if [ ! -z "$INFO_PLIST" ]; then
LABEL_ID=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$INFO_PLIST"
#echo "Set CFBundleVersion to $TRAVIS_BUILD_NUMBER"
fi


#export LINE="\n"
#if [ ! -z "$INFO_PLIST" ]; then
#/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $LABEL_ID" "$INFO_PLIST"
#echo "Set CFBundleVersion to $LABEL_ID"
#fi




curl -X GET -H "X-TrackerToken: $TOKEN" -H "Content-Type: application/json" -H "Accept: application/json" "https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories?with_label=$LABEL_ID" -o $PWD/$OUTPUT_FILE_NAME

#echo "Local Variable "
#value=`cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] | {name: .name, id: .id}'`
#echo "$value"

#echo "Global Variable - 1"
#export ALL_NOTES=`cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] | {name: .name, id: .id}'`


#echo "$ALL_NOTES"

#echo "Global Variable - 2"
#echo $ALL_NOTES

