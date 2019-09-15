Pod::Spec.new do |spec|
  spec.name = "AKGFramework"
  spec.version = "1.0.0"
  spec.summary = "AKG iOS Game Framework"
  spec.homepage = "https://akggames.com"
  spec.license = { type: "MIT", file: "LICENSE" }
  spec.authors = { "Lutfi Azhar" => "lutfi@clappingape.com" }
  spec.social_media_url = "https://akggames.com"

  spec.platform = :ios, "10.0"
  # spec.requires_arc = true
  spec.source = { git: "https://github.com/lutfi99/akgiosframework.git", tag: spec.version.to_s }
  spec.source_files = "AKGFramework/**/*.swift"
  spec.swift_version = "5"
  spec.frameworks = "CoreTelephony", "iAd", "AdSupport", "AuthenticationServices", "SystemConfiguration", "SafariServices", "LocalAuthentication"
  # spec.dependency "GoogleSignIn"
  # spec.dependency "FBSDKLoginKit"
  # spec.dependency "Adjust", "> 4"
  # spec.static_framework = true

  spec.vendored_frameworks = 'AKGFramework/Frameworks/Google/GoogleSignIn.framework', 'AKGFramework/Frameworks/Google/GoogleSignInDependencies.framework', 'AKGFramework/Frameworks/Facebook/FBSDKCoreKit.framework', 'AKGFramework/Frameworks/Facebook/FBSDKLoginKit.framework', 'AKGFramework/Frameworks/Facebook/Bolts.framework', 'AKGFramework/Frameworks/Adjust/AdjustSdk.framework'
  #spec.preserve_paths = 'Frameworks/*.framework'

end
