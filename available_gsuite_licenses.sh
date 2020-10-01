#!/bin/bash
# Sets GAM Path shortcut
gam="$HOME/bin/gam/gam"
# Add your Slack Incoming Webhook URL Below
slack_webhook_url="https://hooks.slack.com/services/..."
# Set threshold to send slack notifications if less then this
license_threshold="5"

# End of settings that need configured

echo "License threshold set to" $license_threshold". Slack notification will be sent if available licenses is less than this."
# Find license count and user count for G Suite Enterprise Licenses
license_count=$($gam info domain | grep 'G Suite Enterprise Licenses' | tr -cd '0-9')
user_count=$($gam print license sku enterprise countsonly | tail -c 4)

# Calculate and display available G Suite user licenses, then store in variable
available_licenses=$(expr $license_count - $user_count)
echo $available_licenses "G Suite Licenses Available"

if [ $available_licenses -lt $license_threshold ] 
then
    curl -X POST -H 'Content-type: application/json' --data "$(eval "echo "'{\"text\": \"$available_licenses G Suite Licenses Available\"}'"")" $slack_webhook_url
else
    echo $available_licenses "Available licenses exceeds the set threshold of" $license_threshold". No Slack notification will be sent"
fi


