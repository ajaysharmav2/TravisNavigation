
#!/bin/sh

#  Get_All_Pivotal_Comments.sh
#
#
#  Created by Nitesh Meshram on 16/03/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
#!/bin/sh


export JQ_OUTPUTDIR="$PWD"
#
#export PERSONAL_API_KEY="6c1b9810a91801321dcc22000ac44c54"

curl --header 'Host: stedolan.github.io' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Referer: http://stedolan.github.io/jq/' --header 'Connection: keep-alive' 'http://stedolan.github.io/jq/download/osx64/jq' -o $JQ_OUTPUTDIR/jq


echo $JQ_OUTPUTDIR

# Chaning permission of JSON Framework
echo "Chaning permission of JSON Framework \n"
chmod +x $JQ_OUTPUTDIR/jq
#

