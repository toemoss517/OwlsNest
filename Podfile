# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'OwlsNest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OwlsNest
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Database'
  pod 'Firebase/Storage'
  
  # Fix warning glitch
  pod 'Protobuf', :inhibit_warnings => true
  pod 'FirebaseFirestore', :inhibit_warnings => true

  target 'OwlsNestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OwlsNestUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
