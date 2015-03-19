#!/bin/sh

#  travis-config.sh
#  XcodeTravis
#
#  Created by Nitesh Meshram on 16/03/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#!/bin/sh

# Standard app config - http://www.pivotaltracker.com/help/api/rest/v5#Search

TOKEN='cf9391f2af5a2b68da2755a27bce2bff'

PROJECT_ID=1114232

QUERY='b108'
LABEL_ID='b104'

QUERY_STRING='with_label=$LABEL_ID&fields=current_state%2Ccomments'


echo "***************************"
echo "* pivotaltracker  *"
echo "***************************"
curl  https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories?fields=current_state%2Ccomments \
-d '{"id":"b104"}'
-H "X-TrackerToken: $TOKEN" \

echo "*****  pivotaltracker *****"

#https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories?with_label=$(LABEL_ID)&fields=current_state%2Ccomments
#curl  https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/search?query=label%3A$QUERY \

#curl -X GET -H "X-TrackerToken: cf9391f2af5a2b68da2755a27bce2bff" "https://www.pivotaltracker.com/services/v5/projects/1114232/search?query=label%3Aapi interaction"
#
#
#export TOKEN='your Pivotal Tracker API token'
#
#export PROJECT_ID=99
#
#curl -X GET -H "X-TrackerToken: $TOKEN" "https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/search?query=label%3Amnt"




#PROJECT_ID=1114232
#API_TOKEN='cf9391f2af5a2b68da2755a27bce2bff'
#LABEL_ID='b104'
#
#echo "***************************"
#echo "* Get All Comments From Pivotal Tracker  *"
#echo "***************************"
#curl https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories?with_label=$LABEL_ID&fields=current_state%2Ccomments \
#-H "X-TrackerToken: $API_TOKEN" \
#echo "Finish"

