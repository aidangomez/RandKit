Pod::Spec.new do |s|
  s.name         = "RandKit"
  s.version      = "0.0.1"
  s.summary      = "Swift framework for random numbers & distributions."
  s.homepage     = "https://github.com/aidangomez/RandKit"
  s.license      = "MIT"
  s.author       = { "Aidan Gomez" => "hello@aidangomez.ca" }

  s.ios.deployment_target = "8.4"
  s.osx.deployment_target = "10.11"

  s.source = { git: "https://github.com/aidangomez/RandKit.git", tag: s.version, submodules: false }
  s.source_files = "Source", "Source/Distributions", "Source/Utilities"
end
