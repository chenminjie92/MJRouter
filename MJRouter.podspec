#
# Be sure to run `pod lib lint MJRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MJRouter'
  s.version          = '1.0.0'
  s.swift_versions    = '5.0'
  s.summary          = '路由服务管理工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                    路由服务管理工具
                       DESC

  s.homepage         = 'https://github.com/chenminjie92/MJRouter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenminjie92@126.com' => '845083062@qq.com' }
  s.source           = { :git => 'https://github.com/chenminjie92/MJRouter.git', :tag => "#{spec.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.platform          = :ios, "10.0"
  s.static_framework  = true
  s.framework = "Foundation","UIKit"

  s.source_files = 'MJRouter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MJRouter' => ['MJRouter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
