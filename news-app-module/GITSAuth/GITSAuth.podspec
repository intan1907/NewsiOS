Pod::Spec.new do |s|
s.name         = "GITSAuth"
s.version      = "0.0.1"
s.summary      = "A short description of swift-ios-framework."
s.homepage     = "https://git.gits.id/RnD/swift-ios-framework"
s.license      = "MIT (ios)"
s.author             = { "GITS Indonesia" => "ajie@gits.co.id" }
s.source       = { :git => "http://git.gits.id/RnD/swift-ios-framework.git", :tag => "#{s.version}" }
s.source_files  = "GITSAuth/Classes/**/*.{h,m,swift}"
s.resource_bundles = {'GITSAuth' => ['GITSAuth/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png}']}
s.platform         = :ios, "9.0"
s.dependency 'GITSFramework'
s.dependency 'GITSNetwork'
end
