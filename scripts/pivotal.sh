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

echo "***************************"
echo "* pivotaltracker  *"
echo "***************************"
curl  https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/search?query=label%3A$QUERY \
-H "X-TrackerToken: $TOKEN" \

echo "*****  pivotaltracker *****"



#curl -X GET -H "X-TrackerToken: cf9391f2af5a2b68da2755a27bce2bff" "https://www.pivotaltracker.com/services/v5/projects/1114232/search?query=label%3Aapi interaction"
#
#
#export TOKEN='your Pivotal Tracker API token'
#
#export PROJECT_ID=99
#
#curl -X GET -H "X-TrackerToken: $TOKEN" "https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/search?query=label%3Amnt"


