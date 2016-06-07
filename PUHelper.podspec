#
# Be sure to run `pod lib lint PUHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PUHelper"
  s.version          = "0.2.1"
  s.summary          = "Collection of helper classes and methods for the PinUp team."

  s.homepage         = "https://github.com/kadarandras/PUHelper"
  s.license          = 'MIT'
  s.author           = { "Andras Kadar" => "kadarandrass@gmail.com" }
  s.source           = { :git => "https://github.com/kadarandras/PUHelper.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PUHelper' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SSKeychain', '~> 1.4.0'
  s.dependency 'RealmSwift', '~> 1.0.0'
end
