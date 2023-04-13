# REF: https://www.visidata.org/docs/customize/
# export $XDG_CONFIG_HOME="$HOME/.config"
# "$XDG_CONFIG_HOME"/visidata/config.py
# ~/.visidatarc

Sheet.addCommand('^D', 'scroll-halfpage-down', 'cursorDown(nScreenRows//2); sheet.topRowIndex += nScreenRows//2')
# Sheet.addCommand('^U', 'scroll-halfpage-down', 'cursorUp(nScreenRows//2); sheet.topRowIndex += nScreenRows//2')
