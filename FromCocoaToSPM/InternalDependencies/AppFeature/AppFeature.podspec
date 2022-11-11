Pod::Spec.new do |s|
    s.name                  = 'AppFeature'
    s.version               = '1.0.0'
    s.author                = 'XING GmbH & Co. KG'
    s.license               = 'commercial'
    s.homepage              = "www.xing.com"
    s.source                = { git: '' }
    s.summary               = "#{s.name} – Version #{s.version}"
    s.ios.deployment_target = '16.0'
    s.swift_version         = '5.6'
    s.source_files          = "Sources/**/*.swift"

    s.dependency 'Appboy-iOS-SDK'
    s.dependency 'ProductsFeature'
    s.dependency 'SettingsFeature'
end
