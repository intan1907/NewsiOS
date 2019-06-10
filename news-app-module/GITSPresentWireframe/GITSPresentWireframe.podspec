Pod::Spec.new do |s|
s.name         = "GITSPresentWireframe"
s.version      = "0.0.1"
s.summary      = "A short description of swift-ios-framework."
s.homepage     = "http://git.gits.id/RnD/swift-ios-framework"
s.license      = "MIT (ios)"
s.author             = { "GITS Indonesia" => "yatnosudar@gits.co.id" }
s.source       = { :git => "http://git.gits.id/RnD/swift-ios-framework.git", :tag => "#{s.version}" }
s.source_files  = "GITSPresentWireframe/Classes/**/*.{h,m,swift}"
s.resource_bundles = {'GITSPresentWireframe' => ['GITSPresentWireframe/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png,plist}']}
s.platform         = :ios, "9.0"
s.resource = 'GITSPresentWireframe/Assets/**/*'
s.dependency 'GITSFramework'
s.dependency 'GITSHome'
end
