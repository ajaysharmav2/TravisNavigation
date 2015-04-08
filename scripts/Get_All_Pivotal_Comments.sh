#!/bin/sh

#  Get_All_Pivotal_Comments.sh
#
#
#  Created by Nitesh Meshram on 16/03/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#!/bin/sh

export LABEL_ID=''
export OUTPUT_FILE_NAME='jsonrespone.text'
export ALL_COMMENTS='allcomments.text'

echo "PATH info plist"
echo $INFOPLIST_FILE


# 'b is label prefix coded as standard prefix for all project'
if [ ! -z "$INFOPLIST_FILE" ]; then
   LABEL_ID=b`/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" $INFOPLIST_FILE`

fi
echo $LABEL_ID
echo LABEL_ID

curl -X GET -H "X-TrackerToken: $PIVOTAL_TOKEN" -H "Content-Type: application/json" -H "Accept: application/json" "https://www.pivotaltracker.com/services/v5/projects/$PIVOTAL_PROJECT_ID/stories?with_label=$LABEL_ID" -o $PWD/$OUTPUT_FILE_NAME
chmod +x $OUTPUT_FILE_NAME

chmod +x $ALL_COMMENTS_FILE

