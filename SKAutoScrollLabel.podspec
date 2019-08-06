Pod::Spec.new do |s|
  s.name         = "SKAutoScrollLabel"
  s.version      = "0.0.5"
  s.summary      = "水平/垂直跑马灯"
  s.description  = <<-DESC
  Automatically scrolling UILabel with both horizontal/vertical MARQUEE effects and gradient gradients on the edges
                   DESC
  s.homepage     = "https://github.com/shevakuilin/SKAutoScrollLabel"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "ShevaKuilin" => "shevakuilin@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/shevakuilin/SKAutoScrollLabel.git", :tag => s.version.to_s }
  s.source_files  = "Source/SKAutoScrollLabel/*.{h,m}"
end