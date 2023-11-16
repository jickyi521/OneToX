# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

flutter_application_path = '../onetox_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'onetox' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  pod 'CYLTabBarController', '~> 1.29.2'
  pod 'CYLTabBarController/Lottie', '~> 1.29.2'  # 依赖Lottie库
  pod 'LookinServer', :configurations => ['Debug']

  install_all_flutter_pods(flutter_application_path)
  # Pods for onetox

  post_install do |installer|
    flutter_post_install(installer) if defined?(flutter_post_install)
  end
  
  target 'onetoxTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'onetoxUITests' do
    # Pods for testing
  end

end
