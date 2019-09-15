Pod::Spec.new do |spec|
  spec.name = 'AKGFramework'
  spec.version = '1.0.0'
  spec.summary = 'AKG iOS Game Framework'
  spec.homepage = 'https://akggames.com'
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { 'Lutfi Azhar' => 'lutfi@clappingape.com' }
  spec.social_media_url = 'https://akggames.com'

  spec.platform = :ios, '10.0'
  spec.requires_arc = true
  spec.source = { git: 'https://github.com/lutfi99/akgiosframework.git', tag: '#{spec.version}'}
  spec.source_files = 'AKGFramework'
  spec.swift_version = '5'
  spec.weak_frameworks = 'GoogleSignIn', 'GoogleSignInDependencies', 'Bolts', 'FBSDKCoreKit', 'FBSDKLoginKit', 'AdjustSdk'
end