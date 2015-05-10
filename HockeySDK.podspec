Pod::Spec.new do |s|
    s.name              = 'HockeySDK'
    s.version           = '3.6.4'

    s.summary           = 'Collect live crash reports, get feedback from your users, distribute your betas, and analyze your test coverage with HockeyApp.'
    s.description       = <<-DESC
    HockeyApp is a service to distribute beta apps, collect crash reports and
    communicate with your app's users.

    It improves the testing process dramatically and can be used for both beta
    and App Store builds.
    DESC

    s.homepage          = 'http://hockeyapp.net/'
    s.documentation_url = 'http://hockeyapp.net/help/sdk/ios/3.6.4/'

    s.license           = 'MIT'
    s.author            = { 'Andreas Linde' => 'mail@andreaslinde.de', 'Thomas Dohmke' => "thomas@dohmke.de" }
	 s.source            = { :git => 'https://github.com/bitstadium/HockeySDK-iOS.git', :tag => s.version.to_s }

    s.platform          = :ios, '6.0'
    s.requires_arc      = true
    
    s.frameworks           = 'Foundation', 'Security', 'SystemConfiguration', 'UIKit'
    s.private_header_files	= 'Classes/*.h'
    s.xcconfig             = {'GCC_PREPROCESSOR_DEFINITIONS' => %{$(inherited) BITHOCKEY_VERSION="@\\"#{s.version}\\"" BITHOCKEY_C_VERSION="\\"#{s.version}\\"" BITHOCKEY_BUILD="@\\"38\\"" BITHOCKEY_C_BUILD="\\"38\\""} }

    s.default_subspecs  = 'Core'
    
    s.subspec 'Core' do |ss|
    	  ss.ios.vendored_frameworks	= 'Vendor/CrashReporter.framework'
    	  
        ss.preserve_paths    = 'Resources', 'Support'
        ss.resource_bundle   = { 'HockeySDKResources' => ['Resources/*.png', 'Resources/*.lproj'] }
        ss.frameworks        = 'CoreText', 'CoreGraphics', 'QuartzCore', 'MobileCoreServices', 'QuickLook', 'AssetsLibrary'
        
        ss.source_files      	  	= 'Classes/**/*.{h,m}', 'Support/FullFeatureConfig/HockeySDKFeatureConfig.h'
        ss.public_header_files	= [
        		'Classes/Public/*.h',
        		'Support/FullFeatureConfig/HockeySDKFeatureConfig.h'
        ]
    end
    
    s.subspec 'CrashOnly' do |ss|
    	  ss.ios.vendored_frameworks	= 'Vendor/CrashReporter.framework'
    	  
        ss.preserve_paths    = 'Support'
    	  
        ss.source_files     		= 'Classes/**/*.{h,m}', 'Support/CrashOnlyConfig/HockeySDKFeatureConfig.h'
        ss.public_header_files	= [
        		'Classes/Public/HockeySDK.h', 
        		'Classes/Public/BITHockeyAttachment.h', 
        		'Classes/Public/BITHockeyBaseManager.h',
        		'Classes/Public/BITHockeyManager.h',
        		'Classes/Public/BITHockeyManagerDelegate.h',
        		'Classes/Public/BITCrash*.h',
        		'Support/CrashOnlyConfig/HockeySDKFeatureConfig.h'
        ]
    end
end