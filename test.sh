#!/usr/bin/env bash
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby
echo ''gem: --no-ri --no-rdoc'' > ~/.gemrc
bundle install
pushd "Example"
pod install
xcodebuild -workspace Pipe\ Dream.xcworkspace -scheme Pipe\ Dream -sdk iphonesimulator build test


