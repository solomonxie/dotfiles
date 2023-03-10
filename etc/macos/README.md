# MacOS Key Remapping

REF: https://hidutil-generator.netlify.app/

Example plist config:
```xml
<?xml version="1.0" encoding="UTF-8"?> <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> <plist version="1.0"> <dict> <key>Label</key> <string>com.local.KeyRemapping</string> <key>ProgramArguments</key> <array> <string>/usr/bin/hidutil</string> <string>property</string> <string>--set</string> <string>{"UserKeyMapping":[ { "HIDKeyboardModifierMappingSrc": 0x70000004A, "HIDKeyboardModifierMappingDst": 0x700000035 } ]}</string> </array> <key>RunAtLoad</key> <true/> </dict> </plist>
```


Commands:
```
sudo launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist

sudo chown root ~/Library/LaunchAgents/com.local.KeyRemapping.plist

sudo chgrp wheel ~/Library/LaunchAgents/com.local.KeyRemapping.plist

launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist


launchctl unload ~/Library/LaunchAgents/com.local.KeyRemapping.plist
launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist
```
