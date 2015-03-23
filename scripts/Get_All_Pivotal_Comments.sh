#!/bin/sh

#  Get_All_Pivotal_Comments.sh
#
#
#  Created by Nitesh Meshram on 16/03/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#!/bin/sh

export PROJECT_ID=1114232
export TOKEN='cf9391f2af5a2b68da2755a27bce2bff'
export LABEL_ID='b104'
export OUTPUT_FILE_NAME='jsonrespone.text'

curl -X GET -H "X-TrackerToken: $TOKEN" -H "Content-Type: application/json" -H "Accept: application/json" "https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories?date_format=millis&fields=current_state%2Ccomments&with_label=$LABEL_ID" -o $OUTPUT_FILE_NAME

chmod +x $OUTPUT_FILE_NAME

cat $OUTPUT_FILE_NAME | jq '.[] .comments [].text'

#cat json.txt | jq '.[0] .comments[0].text'

