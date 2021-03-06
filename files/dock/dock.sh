#!/bin/bash

/usr/local/bin/dockutil --remove all --no-restart
/usr/local/bin/dockutil --add '/Applications/Google Chrome.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Visual Studio Code.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/iTerm.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Tweetbot.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Slack.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/VMware Fusion.app' --no-restart
/usr/local/bin/dockutil --add '~/Downloads' --view auto --display stack --sort dateadded
