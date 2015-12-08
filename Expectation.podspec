Pod::Spec.new do |s|

  s.name         = "Expectation"
  s.version      = "0.0.1"
  s.summary      = "XCTest Matcher framework for Swift"

  s.description  = <<-DESC
                   A simple and elegant matcher framework built on top of XCTest for Swift.
                   DESC

  s.homepage     = "https://github.com/ollieatkinson/Expectation"
  s.license      = "MIT"
  s.author       = { "Oliver Atkinson" => "oliveratkinson@me.com" }

  s.ios.deployment_target = "8.0"

  s.module_name  = "Expectation"
  s.source       = git: "https://github.com/ollieatkinson/Expectation.git", tag: "0.0.1"
  s.source_files = "Expectation/Source/*.swift"
  s.frameworks   = [ "Foundation", "XCTest" ]
  
end
