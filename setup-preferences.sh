# Based on Pawel Grzybek's Article: https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/

# *************
# DOCK SETTINGS
# *************

# Position Dock on the left
defaults write com.apple.dock orientation -string "left"

# Autohide dock
defaults write com.apple.dock autohide -int 1

# Speed up dock hide animation
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock autohide-delay -float 0

# Hide recent apps
defaults write com.apple.dock show-recents -int 0

# Disable hot corners
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-bl-modifier -int 1048576
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 1048576
defaults write com.apple.dock wvous-tl-corner -int 1
defaults write com.apple.dock wvous-tl-modifier -int 1048576
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 1048576

# *******
# DESKTOP
# *******

# Snap to grid and organize by date added
# Nested object -- can't figure out notation to access
# defaults write com.apple.finder DesktopViewSettings.IconViewSettings.arrangeBy -string "dateAdded"

# *****************
# TRACKPAD SETTINGS
# *****************

# System Preferences > Trackpad > Point & Click > Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# System Preferences > Trackpad > More Gestures > Mission Control
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

# System Preferences > Trackpad > More Gestures > Swipe between full-page apps
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0

# System Preferences > Trackpad > More Gestures > Notification center
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0

# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Options > Enable Dragging > Three Finger Drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

# ********
# TERMINAL
# ********

# Set color theme
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"

# *******
# NAV/TOUCH BAR
# *******

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Analog clock
defaults write com.apple.menuextra.clock IsAnalog -int 1

# Control strip
defaults write com.apple.controlstrip MiniCustomized -array com.apple.system.launchpad com.apple.system.brightness com.apple.system.volume com.apple.system.mute

# ****
# MISC
# ****

# Turn off Siri
defaults write com.apple.Siri VoiceTriggerUserEnabled -int 0

# Turn off double space for period
defaults write "Apple Global Domain" NSAutomaticPeriodSubstitutionEnabled -int 0

# ********
# TEXTEDIT
# ********

# Turn off autocorrect
defaults write com.apple.TextEdit TextReplacement -int 0
defaults write com.apple.TextEdit CorrectSpellingAutomatically -int 0
