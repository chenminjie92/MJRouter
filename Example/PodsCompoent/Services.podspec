Pod::Spec.new do |spec|
  spec.name              = "Services"
  spec.version           = '1.0'
  spec.swift_versions    = '5.0'
  spec.license           = { :type => 'MIT', :text => <<-LICENSE
                              Copyright 2019
                              LICENSE
                            }
  spec.summary           = "模块对外服务"
  spec.description       = <<-DESC
                            模块对外服务
                            DESC
  spec.homepage          = "git"
  spec.author            = { "chenminjie" => "845083062@qq.com" }

  spec.source            = { :git => "", :tag => "#{spec.version}" }
  spec.platform          = :ios, "10.0"
  spec.static_framework  = true

  spec.public_header_files = 'Services/*.h'
  spec.source_files      = 'Services/**/*.{h,m,swift}'
  spec.resource_bundles  = {
    'PublicService' => ['Services/**/*.{png,jpg,xib}']
  }
  spec.dependency     'MJRouter'
end
