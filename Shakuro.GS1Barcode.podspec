Pod::Spec.new do |s|

    s.name             = 'Shakuro.GS1Barcode'
    s.version          = '1.0.0'
    s.summary          = 'GS1Barcode'
    s.homepage         = 'https://github.com/shakurocom/GS1Barcode'
    s.license          = { :type => "MIT", :file => "LICENSE.md" }
    s.authors          = {'slaschuk' => 'slaschuk2@shakuro.com'}
    s.source           = { :git => 'https://github.com/shakurocom/GS1Barcode.git', :tag => s.version }
    s.swift_versions   = ['5.1', '5.2', '5.3', '5.4', '5.5', '5.6']
    s.source_files     = 'Source/*'
    s.ios.deployment_target = '11.0'

end
