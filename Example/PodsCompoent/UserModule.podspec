Pod::Spec.new do |spec|
  spec.name              = "UserModule"
  spec.version           = '1.0'
  spec.swift_versions    = '5.0'
  spec.license           = { :type => 'MIT', :text => <<-LICENSE
                              Copyright 2019
                              LICENSE
                            }
  spec.summary           = "用户服务"
  spec.description       = <<-DESC
                            用户服务
                            DESC
  spec.homepage          = "git"
  spec.author            = { "chenminjie" => "845083062@qq.com" }

  spec.source            = { :git => "", :tag => "#{spec.version}" }
  spec.platform          = :ios, "10.0"
  spec.static_framework  = true

  spec.source_files      = 'UserModule/**/*.{h,m,swift}'
  spec.resource_bundles  = {
    'UserModule' => ['UserModule/**/*.{png,jpg,xib}']
  }
  spec.framework = "Foundation","UIKit"
  spec.dependency     'Services'
  spec.dependency     'SnapKit'
end
