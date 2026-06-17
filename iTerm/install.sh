#!/bin/bash

chsh -s /bin/bash
pip3 install powerline-status

open -b com.apple.FontBook *.otf

ln -f $(pwd)/iterm.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/iterm.json
cp -f *plist ~/Library/Preferences/
