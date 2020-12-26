cd "`dirname "$0"`"

# Clean
rm -rf Inky-darwin-x64/
rm ReleaseUpload/Inky_mac.dmg

# Ensure it's correctly/fully installed first
( cd app && npm install -D )

# Create icon from PNG
./resources/makeIcns.command

# Mac
( cd app && npm run-script build)

# Create a DMG
# Requires appdmg: npm install -g appdmg
# https://www.npmjs.com/package/appdmg
mkdir -p ReleaseUpload
appdmg resources/appdmg.json ReleaseUpload/Inky_mac.dmg

# Remove .icns again
rm resources/Icon.icns
