Pod::Spec.new do |s|
  s.name             = 'ISGUnicode'
  s.version          = '1.0'
  s.summary          = 'ISGUnicode.'
  s.description      = <<-DESC
TODO: 控制台输出中文.
                       DESC

  s.homepage         = 'https://github.com/Isaaclzg/ISGUnicode'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Isaaclzg' => 'isaac_gang@163.com' }
  s.source           = { :git => 'https://github.com/Isaaclzg/ISGUnicode.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.jianshu.com/u/7e1b920cdac1'
  s.ios.deployment_target = '8.0'
  s.source_files = 'ISGUnicode/Classes/**/*'
  s.frameworks = 'Foundation'

end
