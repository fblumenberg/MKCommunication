#
# Be sure to run `pod spec lint MKCommunication.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "MKCommunication"
  s.version      = "1.3.0"
  s.summary      = "A library which implements the base communication to a Mikrokopter via TCP/IP."
  s.license      = 'MIT'
  s.author       = { "frank" => "frank@frankblumenberg.de" }
  s.homepage     = 'https://github.com/fblumenberg/MKCommunication'

  s.source       = { :git => "https://github.com/fblumenberg/MKCommunication.git", :tag => "1.0.0-a" }

  s.platform     = :ios, '5.0'
  s.source_files = 'MKCommunication', 'MKCommunication/**/*.{h,m}'

  s.resource  = "MKCommunication/MKConnection/Simulator/FakeOsd.csv",'MKCommunication/Resources/*.lproj'
  s.frameworks = 'CoreGraphics', 'CoreLocation', 'CFNetwork'
  s.requires_arc = true
  s.dependency 'CocoaLumberjack'
end
