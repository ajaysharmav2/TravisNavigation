#!/bin/sh

#  Get_All_Pivotal_Comments.sh
#
#
#  Created by Nitesh Meshram on 16/03/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#!/bin/sh



export PROJECT_ID=1114232
export TOKEN='cf9391f2af5a2b68da2755a27bce2bff'
export LABEL_ID='b199'
export OUTPUT_FILE_NAME='jsonrespone.text'

export ALL_COMMENTS='allcomments.text'


export LINE="\n"
if [ ! -z "$INFO_PLIST" ]; then
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $LABEL_ID" "$INFO_PLIST"
echo "Set CFBundleVersion to $LABEL_ID"
fi

echo "JQ Path"
echo $JQ_OUTPUTDIR


echo "PWD - GetAll Script"

#echo PWD
#
#echo $PWD

curl -X GET -H "X-TrackerToken: $TOKEN" -H "Content-Type: application/json" -H "Accept: application/json" "https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories?date_format=millis&fields=current_state%2Ccomments&with_label=$LABEL_ID" -o $PWD/$OUTPUT_FILE_NAME

#chmod +x $OUTPUT_FILE_NAME

echo "Show all the comments \n"

#cat $PWD/$OUTPUT_FILE_NAME 

#echo "Parse text file"

#ls -la
#
#echo "type 1"
cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] .comments [].text' > $ALL_COMMENTS


chmod +x $PWD/$ALL_COMMENTS

while read line
do
ALL_NOTES=$ALL_NOTES$LINE$line
#echo $line
done <$PWD/finalcomments.text
echo "\n\nAll Text"
echo $ALL_NOTES

#cat $PWD/$OUTPUT_FILE_NAME | $PWD/jq '.[] .comments [].text' > $ALL_COMMENTS




#cat $ALL_COMMENTS | awk -F "[" '{print $2}'

#$ALL_NOTES=($ALL_COMMENTS | awk -F "[" '{print $2}')
#echo "All Filtered Commands"
#
#echo $ALL_NOTES

