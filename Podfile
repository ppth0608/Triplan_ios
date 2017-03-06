# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

target 'Triplan' do
  # Network
  pod 'Moya/RxSwift', '~> 8.0.0-beta.2'
#  pod 'Moya-ModelMapper/RxSwift', '4.0.0-beta.1'

  # Rx
  pod 'RxSwift', '~> 3.1'
  pod 'RxCocoa', '~> 3.1'
  pod 'RxDataSources', '~> 1.0'
  pod 'RxOptional', '~> 3.1'
  
  # DB
  pod 'RealmSwift'
  
  # UI
  pod 'PKHUD', '~> 4.0'
  pod 'GoogleMaps'
  pod "BPStatusBarAlert"
  
  # UserDefaults
  pod 'SwiftyUserDefaults'
  
  # Animation
  pod "Hero"
  pod "lottie-ios"
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

