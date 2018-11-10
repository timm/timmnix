#Don’t animate opening applications from the Dock

defaults write com.apple.dock launchanim -bool false
#Speed up Mission Control animations

defaults write com.apple.dock expose-animation-duration -float 1.0
#Remove the auto-hiding Dock delay

defaults write com.apple.dock autohide-delay -float 0
#Remove the animation when hiding/showing the Dock

defaults write com.apple.dock autohide-time-modifier -float 0
#Increase window resize speed for Cocoa applications

defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
#Once done, you'll need to killAll Finder && killAll Dock to restart those programs.
killAll Finder
killAll Dock


