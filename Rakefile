# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

require 'ib'
# require 'motion-cocoapods'


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'reactive'
  app.icon = 'icon.icns'
  app.info_plist['CFBundleIconFile'] = 'Icon.icns'
  
  app.pods do
    # Details here: https://github.com/rheinfabrik/RFOverlayScrollView
    pod 'RFOverlayScrollView'
  end
end
