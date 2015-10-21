Pod::Spec.new do |s|
  s.module_name = 'OrderedDictionary'
  s.name = 'OrderedDictionary'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Common Ordered Dictionary for @levantAJ team'
  s.homepage = 'https://github.com/levantAJ'
  s.authors = { 'Le Tai' => 'sirlevantai@gmail.com' }
  s.source = {  :git => 'https://github.com/levantAJ/OrderedDictionary.git', :tag => s.version}
  s.source_files = 'OrderedDictionary/**/*.{h,swift}'
  s.resources = "OrderedDictionary/**/*.{xib}"
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
end
