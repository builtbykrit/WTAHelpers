Pod::Spec.new do |s|
  s.name     = 'WTAHelpers'
  s.version  = '0.1.1'
  s.license  = 'MIT'
  s.summary  = 'An assortment of useful categories and classes.'
  s.homepage = 'https://github.com/willowtreeapps/WTAHelpers'
  s.authors  = { 'Trung Tran' => 'trung.tran@willowtreeapps.com' }
  s.source   = { :git => 'https://github.com/willowtreeapps/WTAHelpers', :tag => s.version }
  s.requires_arc = true
  s.ios.deployment_target = '6.0'
  s.source_files = 'WTAHelpers/*.{h,m}'

  s.subspec 'WTAFrameHelpers' do |ss|
    ss.source_files = 'WTAHelpers/WTAFrameHelpers/*.{h,m}'
  end

  s.subspec 'WTAAutoLayoutHelpers' do |ss|
    ss.source_files = 'WTAHelpers/WTAAutoLayoutHelpers/*.{h,m}'
  end

  s.subspec 'WTAColorImage' do |ss|
    ss.source_files = 'WTAHelpers/WTAColorImage/*.{h,m}'
  end

  s.subspec 'WTANibLoading' do |ss|
    ss.source_files = 'WTAHelpers/WTANibLoading/*.{h,m}'
  end

  s.subspec 'WTAReusableIdentifier' do |ss|
    ss.source_files = 'WTAHelpers/WTAReusableIdentifier/*.{h,m}'
  end

  s.subspec 'WTAColorHelpers' do |ss|
  	ss.source_files = 'WTAHelpers/WTAColorHelpers/*.{h,m}'
  end

  s.subspec 'WTADeviceHelpers' do |ss|
    ss.source_files = 'WTAHelpers/WTADeviceHelpers/*.{h,m}'
    ss.frameworks = 'SystemConfiguration', 'AVFoundation'
  end
end
