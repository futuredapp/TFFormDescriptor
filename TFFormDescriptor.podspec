#
# Be sure to run `pod lib lint TFFormDescriptor.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TFFormDescriptor"
  s.version          = "0.0.1"
  s.summary          = "Simple descriptor for building various forms."
  s.description      = <<-DESC
                       TFFormDescriptor is simple form descriptor that helps you with building form with various contents. It's' based on TFTableDescriptor.
                       DESC
  s.homepage         = "https://github.com/thefuntasty/TFFormDescriptor"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ales Kocur" => "aleskocur@icloud.com" }
  s.source           = { :git => "https://github.com/thefuntasty/TFFormDescriptor.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.resources = 'Pod/Classes/**/*.{xib}'
#s.resource_bundles = {
#    'TFFormDescriptor' => ['Pod/Assets/*.png', 'Pod/Classes/**/*.xib']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'TFTableDescriptor', '~> 1.2.0'
  #s.dependency 'TFTableDescriptor'

end
