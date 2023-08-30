# REF: https://hidutil-generator.netlify.app
/usr/bin/hidutil list
/usr/bin/hidutil property --set '{"UserKeyMapping":[]}'
# /usr/bin/hidutil property --matching '{"ProductID": 0x343}' --get "UserKeyMapping"
# /usr/bin/hidutil property --matching '{"ProductID": 0x343}' --set '{"UserKeyMapping":[]}'
/usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --get "UserKeyMapping"
/usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --set '{"UserKeyMapping":[]}'

# Ziyoulang Keyboard
/usr/bin/hidutil property --match '{"ProductID": 0x2608}' --set \
'{"UserKeyMapping":[ { "HIDKeyboardModifierMappingSrc": 0x70000004A, "HIDKeyboardModifierMappingDst": 0x700000029 }, { "HIDKeyboardModifierMappingSrc": 0x70000004B, "HIDKeyboardModifierMappingDst": 0xC000000E9 }, { "HIDKeyboardModifierMappingSrc": 0x70000004E, "HIDKeyboardModifierMappingDst": 0xC000000EA }, { "HIDKeyboardModifierMappingSrc": 0x70000004C, "HIDKeyboardModifierMappingDst": 0xC000000CD }, { "HIDKeyboardModifierMappingSrc": 0x700000029, "HIDKeyboardModifierMappingDst": 0x700000035 } ]}'
/usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --get "UserKeyMapping"

# Keychron Q1
/usr/bin/hidutil property --match '{"ProductID": 0x313}' --set \
'{"UserKeyMapping":[
    {
      "HIDKeyboardModifierMappingSrc": 0x700000064,
      "HIDKeyboardModifierMappingDst": 0x7000000E1
    }
]}'
/usr/bin/hidutil property --matching '{"ProductID": 0x313}' --get "UserKeyMapping"

date |tee /tmp/refresh_keymap_time.txt
