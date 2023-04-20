#
# Be sure to run `pod lib lint Donkey.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Donkey'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Donkey.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/HolyPaPa99/Donkey'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sean' => 'seanlee0v0@icloud.com' }
  s.source           = { :git => 'https://github.com/HolyPaPa99/Donkey.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'

  s.source_files = 'Donkey/Source/**/*'
  
  # s.resource_bundles = {
  #   'Donkey' => ['Donkey/Assets/*.png']
  # }

  s.public_header_files = 'Donkey/Source/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Introspect', '~> 0.1.3'
  s.dependency 'Alamofire', '~> 5.2'
  s.dependency 'CleanJSON', '~> 1.0.8'
end
