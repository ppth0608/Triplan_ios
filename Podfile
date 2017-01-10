# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

target 'Triplan' do
  pod 'Moya/RxSwift'
  pod 'Moya-ModelMapper/RxSwift', '4.0.0-beta.1'
  pod 'RxOptional'
  pod 'RxSwift',    '3.0.0-beta.2'
  pod 'RxCocoa',    '3.0.0-beta.2'
  pod 'RealmSwift'
  pod 'PKHUD', '~> 4.0'
  pod "JDropDownAlert"
  pod 'SwiftyUserDefaults'
  pod 'GoogleMaps'
  pod "Hero"
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

