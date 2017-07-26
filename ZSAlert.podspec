#
#  Be sure to run `pod spec lint ZSAlert.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "ZSAlert"
  s.version      = "0.0.1"
  s.summary      = "这是一个描述,测试描述的长度"
  s.description  = <<-DESC
                      这是一个描述,测试描述的长度,这是一个描述,测试描述的长度
                      这是一个描述,测试描述的长度
                      这是一个描述,测试描述的长度
                      这是一个描述,测试描述的长度
                   DESC

  s.homepage     = "https://github.com/YunZhongManMu/ZSAlert"
  s.license      = "MIT"
  s.author             = { "周顺" => "yunzhong1075@126.com" }
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/YunZhongManMu/ZSAlert.git", :tag => "#{s.version}" }
  s.source_files  = "ZSAlerTool/*.{h,m}"
  # //"ZSAlert/ZSAlert/*"
  s.exclude_files = "Classes/Exclude"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
