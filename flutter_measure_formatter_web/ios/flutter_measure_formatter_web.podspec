#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_measure_formatter_web'
  s.version          = '0.0.1'
  s.summary          = 'No-op implementation of flutter_measure_formatter_web web plugin to avoid build issues on iOS'
  s.description      = <<-DESC
temp fake url_launcher_web plugin
                       DESC
  s.homepage         = 'https://github.com/flutter/plugins/tree/master/packages/url_launcher/url_launcher_web'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tomas Radvansky' => 'tomas@rdev.software' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '10.0'
end