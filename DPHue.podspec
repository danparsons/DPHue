Pod::Spec.new do |s|
  s.name         = "DPHue"
  s.version      = "1.3.2"
  s.summary      = "Objective-C library for interacting with Philips Hue lighting systems"
  s.homepage     = "https://github.com/danparsons/DPHue"
  s.license      = "public domain"
  s.author       = { "Dan Parsons" => "dparsons@nyip.net" }
  s.source       = { :git => "https://github.com/danparsons/DPHue.git", :commit => "db7a1ff0f40b25ffa81de050782d1efa27160a67" }
  s.source_files = 'DPHue/*.{h,m}'
  s.framework = 'CommonCrypto'
  s.requires_arc = true
  s.dependency 'CocoaAsyncSocket', '~> 0.0.1'
end
