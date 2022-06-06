#!/usr/bin/zsh

# com.apple.accessibility
# com.apple.AppleMediaServices
# com.apple.CharacterPicker
# com.apple.CharacterPaletteIM
# com.apple.EmojiPreferences
# com.apple.Preview
# com.apple.Preview.ViewState
# com.apple.Siri
# com.apple.Spotlight
# com.apple.Terminal
# com.apple.TextEdit
# com.apple.TextInputMenu
# com.apple.configurationprofiles.user
# com.apple.corespotlightui
# com.apple.scriptmenu

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
# sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#==============================================================================
# SECTION General UI
#==============================================================================

# Set theme to Auto
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Set Accent color to Blue
defaults write NSGlobalDomain AppleAccentColor -int 4
defaults write NSGlobalDomain AppleAquaColorVariant -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.698039 0.843137 1.000000 Blue"

# Show scrollbars when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Possible values: "WhenScrolling" | "Automatic" | "Always"

# Set clock format
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm a"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock ShowSeconds -bool false


# END !SECTION General UI
#==============================================================================
# SECTION Dock & Menu Bar
#==============================================================================

# Auto hide / show the dock
defaults write com.apple.dock autohide -bool true;

# Remove the auto-hiding Dock delay
# defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
# defaults write com.apple.dock autohide-time-modifier -float 0

# Set scale effect for minimizing windows
defaults write com.apple.dock mineffect -string "scale"
# possible values "genie" | "scale"

# Disables magnification
defaults write com.apple.dock magnification -bool false

# Disable show recent apps
defaults write com.apple.dock show-recents -bool false

# Set dock position to bottom
defaults write com.apple.dock orientation -string "bottom"
# possible values "bottom" | "left" | "right"

# REVIEW
# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Set size of dock Default = 48
defaults write com.apple.dock tilesize -int 48

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Enable highlight hover effect for the grid view of a stack (Dock)
# defaults write com.apple.dock mouse-over-hilite-stack -bool true

# END !SECTION Dock & Menu Bar
#==============================================================================
# SECTION Mission Control, Launchpad, & Spaces
#==============================================================================

# REVIEW
# Speed up Mission Control animations
# defaults write com.apple.dock expose-animation-duration -float 0.1

# REVIEW what is dashboard?
# Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true
# Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true

echo "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

# Add iOS & Watch Simulator to Launchpad
#sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
#sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

# REVIEW Not sure what this does actually?
# echo "When switching to an application, don't switch to a space with open windows for that application"
# defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool false;

# END !SECTION Mission Control
#==============================================================================
# SECTION Input Behavior
# I've commented some of this out because I'm not sure I want to commit to it
#==============================================================================

# echo "Disable automatic capitalization as it’s annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# echo "Disable smart dashes as they’re annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# echo "Disable automatic period substitution as it’s annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# echo "Disable smart quotes as they’re annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# echo "Disable auto-correct"
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Enable context menu gesture"
defaults write NSGlobalDomain ContextMenuGesture -bool true

echo "Enables tap to click"
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Sets tracking speed"
defaults write com.apple.trackpad.scaling -int 1

echo "Disable swipe between pages"
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

# REVIEW how to enable this via cli?
# Swipe between full screen apps
# possibly in com.apple.AppleMultitouchTrackpad

# REVIEW how to enable this via cli?
# Enable gesture for the Notification Center
# possibly in com.apple.AppleMultitouchTrackpad

echo "Enable gesture for Mission Control"
defaults write com.apple.dock showMissionControlGestureEnabled -bool true

echo "Disable gesture for App Expose"
defaults write com.apple.dock showAppExposeGestureEnabled -bool false

echo "Enable gesture for Launchpad"
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true

echo "Enable gesture for Show Desktop"
defaults write com.apple.dock showDesktopGestureEnabled -bool true

echo "Use keyboard navigation to move focus between controls"
# Use "3" for full system access, 2 for a lighter version of that
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# echo "Disabling press-and-hold for special keys in favor of key repeat"
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# echo "Setting a blazingly fast keyboard repeat rate"
# defaults write NSGlobalDomain KeyRepeat -int 0

# END !SECTION Input Behavior
#==============================================================================
# SECTION Finder
#==============================================================================

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show all file extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# REVIEW spring loading
# Enable spring loading for directories
# defaults write NSGlobalDomain com.apple.springing.enabled -bool true
# Remove the spring loading delay for directories
# defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# END !SECTION Finder
#==============================================================================
# SECTION Screenshots
#==============================================================================

# Change screenshot save location
defaults write com.apple.screencapture location -string "~/Pictures/Screenshots"

# Set the screenshot format
defaults write com.apple.screencapture type -string "png"
# possible values "bmp" | "gif" | "jpg" | "pdf" | "png" | "tiff"

# REVIEW Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# END !SECTION Screenshots
#==============================================================================
# SECTION Misc
#==============================================================================

# REVIEW Expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# REVIEW Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# REVIEW Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# REVIEW Disable automatic termination of inactive apps
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# REVIEW Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# END !SECTION Misc
#==============================================================================
# SECTION Restart
#==============================================================================

for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Terminal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."

# END !SECTION Restart
