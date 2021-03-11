Pod::Spec.new do |spec|
  spec.name              = "LoginModule"
  spec.version           = '1.0'
  spec.swift_versions    = '5.0'
  spec.license           = { :type => 'MIT', :text => <<-LICENSE
                              Copyright 2019
                              LICENSE
                            }
  spec.summary           = "登录服务"
  spec.description       = <<-DESC
                            登录服务
                            DESC
  spec.homepage          = "git"
  spec.author            = { "chenminjie" => "845083062@qq.com" }

  spec.source            = { :git => "", :tag => "#{spec.version}" }
  spec.platform          = :ios, "10.0"
  spec.static_framework  = true

  spec.source_files      = 'LoginModule/**/*.{h,m,swift}'
  spec.resource_bundles  = {
    'LoginModule' => ['LoginModule/**/*.{png,jpg,xib}']
  }
  spec.framework = "Foundation","UIKit"
  spec.dependency     'Services'
  spec.dependency     'SnapKit'
end
