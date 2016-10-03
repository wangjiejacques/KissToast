#
# Be sure to run `pod lib lint KissToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KissToast'
  s.version          = '0.1.1'
  s.summary          = 'A simple and stupid Toast implementation with Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This CocoaPod provides the ability to use a `Toast.show("message", "duration")` to display a toast.
                       DESC

  s.homepage         = 'https://github.com/WANGjieJacques/KissToast'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WANG Jie' => 'jacques09125715@gmail.com' }
  s.source           = { :git => 'https://github.com/WANGjieJacques/KissToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KissToast/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KissToast' => ['KissToast/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
