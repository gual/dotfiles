#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title main-brave
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🌐

# Documentation:
# @raycast.description opens brave with main profile
# @raycast.author gualberto_escalante
# @raycast.authorURL https://raycast.com/gualberto_escalante

open -na "Brave Browser" --args --profile-directory="Profile 2" --new-window
