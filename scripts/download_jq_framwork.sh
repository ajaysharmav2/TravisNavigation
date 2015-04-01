
#export PROJECT_ID=1114232
#export TOKEN='cf9391f2af5a2b68da2755a27bce2bff'
#
#curl -X GET -H "X-TrackerToken: cf9391f2af5a2b68da2755a27bce2bff" -H "Content-Type: application/json" -H "Accept: application/json" "https://www.pivotaltracker.com/services/v5/projects/1114232/stories?date_format=millis&with_label=b104"


# Downloading JSON Framework

curl --header 'Host: stedolan.github.io' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Referer: http://stedolan.github.io/jq/download/' --header 'Connection: keep-alive' 'http://stedolan.github.io/jq/download/linux64/jq' -o 'jq' -L

# Chaning permission of JSON Framework
chmod +x ./jq

# Moving JSON Framework
sudo cp ./scripts/jq /usr/local/bin


