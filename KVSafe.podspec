#
#  Be sure to run `pod spec lint KVSafe.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "KVSafe"
  s.version      = "0.0.1"
  s.summary      = "KVSafe lets you use NSDictionary & NSArray never crash."

  s.description  = <<-DESC
                      KVSafe lets you use NSDictionary & NSArray never crash.
                      Because of JSON is type mutable DataSet, and network services are unstable.
                      We USE Plist and KVSafe to promise the data type always return we expected.
                   DESC

  s.homepage     = "https://github.com/duowan/KVSafe"

  s.license      = "MIT"

  s.author             = { "PonyCui" => "cuiminghui@yy.com" }

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/duowan/KVSafe.git" }

  s.source_files  = "KVSafe", "KVSafe/*.{h,m}"

  s.requires_arc = true

end
