Pod::Spec.new do |s|
  s.name             = 'MultiUser'
  s.version          = '0.0.1'
  s.summary          = 'MultiUser handling for applications.'
  s.homepage         = 'https://github.com/smuellner/MultiUser-for-swift'
  s.license          = { type: 'Apache', file: 'LICENSE' }
  s.author           = { 'smuellner' => 'sascha.muellner@gmail.com' }
  s.source           = { :git => "https://github.com/smuellner/MultiUser-for-swift.git", :tag => s.version.to_s }

  s.swift_version    = '5.0'
  s.source_files     = 'Sources/**/*.{swift,h}'

  s.ios.deployment_target     = '13.0'
  s.osx.deployment_target     = '10.15'
  s.watchos.deployment_target = '6.0'
  s.tvos.deployment_target    = '13.0'
end
