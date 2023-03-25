# MacOS Key Remapping

REF: https://hidutil-generator.netlify.app/


## Core: `hidutil`


## Use `plist` to be persistent

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


## Use `bash script` to be persistent

TBD


## Use Alfred to be flexible

Alfred workflow: Hotkey -> Run Script:
```
/bin/bash -c $HOME/myconf/dotfiles/etc/macos/remap_external_keyboard_60keys.sh  |tee /tmp/keymap.txt
```

The script:
```sh
/usr/bin/hidutil property --set '{"UserKeyMapping":[]}'
/usr/bin/hidutil property --matching '{"ProductID": 0x343}' --get "UserKeyMapping"
/usr/bin/hidutil property --matching '{"ProductID": 0x343}' --set '{"UserKeyMapping":[]}'
/usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --get "UserKeyMapping"
/usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --set '{"UserKeyMapping":[]}'
/usr/bin/hidutil property --match '{"ProductID": 0x2608}' --set \
'{"UserKeyMapping":[{ "HIDKeyboardModifierMappingSrc": 0x70000004A, "HIDKeyboardModifierMappingDst": 0x700000035 }, { "HIDKeyboardModifierMappingSrc": 0x70000004B, "HIDKeyboardModifierMappingDst": 0xC000000E9 }, { "HIDKeyboardModifierMappingSrc": 0x70000004E, "HIDKeyboardModifierMappingDst": 0xC000000EA }, { "HIDKeyboardModifierMappingSrc": 0x70000004C, "HIDKeyboardModifierMappingDst": 0xC000000CD }, { "HIDKeyboardModifierMappingSrc": 0x7000000E3, "HIDKeyboardModifierMappingDst": 0x7000000E2 }, { "HIDKeyboardModifierMappingSrc": 0x7000000E2, "HIDKeyboardModifierMappingDst": 0x7000000E3 }, { "HIDKeyboardModifierMappingSrc": 0x7000000E6, "HIDKeyboardModifierMappingDst": 0x7000000E7 } ]}'
/usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --get "UserKeyMapping"
date
```
