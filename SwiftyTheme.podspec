
Pod::Spec.new do |s|
  s.name             = 'SwiftyTheme.swift'
  s.version          = '0.0.1'
  s.summary          = '轻量级主题、皮肤管理库，兼容OC'
  s.description      = '轻量级主题、皮肤管理库，兼容OC'
  s.homepage         = 'https://github.com/liujunliuhong/SwiftyTheme'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liujunliuhong' => '1035841713@qq.com' }
  s.source           = { :git => 'https://github.com/liujunliuhong/SwiftyTheme.git', :tag => s.version.to_s }

  s.module_name = 'SwiftyTheme'
  s.swift_version = '5.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source_files = 'Sources/*'
end
