#
# Be sure to run `pod lib lint TMIndicatorButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TMIndicatorButton'
  s.version          = '0.1.0'
  s.summary          = '一个支持多种加载动画的按钮组件'
  s.description      = <<-DESC
TMIndicatorButton 是一个功能丰富的 iOS 按钮组件，支持多种加载动画效果。
主要特性：
- 支持多种内置动画效果
- 支持自定义动画
- 支持按钮状态切换
- 使用简单，配置灵活
                       DESC

  s.homepage         = 'https://github.com/dragonOrganization/TMIndicatorButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DragonBattlesun' => 'dragonbattlesun@gmail.com' }
  s.source           = { :git => 'https://github.com/dragonOrganization/TMIndicatorButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.source_files = 'TMIndicatorButton/**/*'

  # s.resource_bundles = {
  #   'TMIndicatorButton' => ['TMIndicatorButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'MaterialComponents/Buttons'
  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES',
    'SWIFT_OPTIMIZATION_LEVEL' => '-Onone',
    'ENABLE_BITCODE' => 'NO',
    'CLANG_ENABLE_MODULES' => 'YES',
    'SWIFT_VERSION' => '5.0',
    'IPHONEOS_DEPLOYMENT_TARGET' => '13.0',
    'OTHER_LDFLAGS' => '-ObjC'
  }
  s.static_framework = true
end
