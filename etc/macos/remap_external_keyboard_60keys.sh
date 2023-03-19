while true
do
    /usr/bin/hidutil property --set '{"UserKeyMapping":[]}'
    /usr/bin/hidutil property --matching '{"ProductID": 0x343}' --get "UserKeyMapping"
    /usr/bin/hidutil property --matching '{"ProductID": 0x343}' --set '{"UserKeyMapping":[]}'
    /usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --get "UserKeyMapping"
    /usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --set '{"UserKeyMapping":[]}'
    /usr/bin/hidutil property --match '{"ProductID": 0x2608}' --set \
    '{"UserKeyMapping":[{ "HIDKeyboardModifierMappingSrc": 0x70000004A, "HIDKeyboardModifierMappingDst": 0x700000035 }, { "HIDKeyboardModifierMappingSrc": 0x70000004B, "HIDKeyboardModifierMappingDst": 0xC000000E9 }, { "HIDKeyboardModifierMappingSrc": 0x70000004E, "HIDKeyboardModifierMappingDst": 0xC000000EA }, { "HIDKeyboardModifierMappingSrc": 0x70000004C, "HIDKeyboardModifierMappingDst": 0xC000000CD }, { "HIDKeyboardModifierMappingSrc": 0x7000000E3, "HIDKeyboardModifierMappingDst": 0x7000000E2 }, { "HIDKeyboardModifierMappingSrc": 0x7000000E2, "HIDKeyboardModifierMappingDst": 0x7000000E3 }, { "HIDKeyboardModifierMappingSrc": 0x7000000E6, "HIDKeyboardModifierMappingDst": 0x7000000E7 } ]}'
    /usr/bin/hidutil property --matching '{"ProductID": 0x2608}' --get "UserKeyMapping"
    date |tee /tmp/refresh_keymap_time.txt
    sleep 10
done
