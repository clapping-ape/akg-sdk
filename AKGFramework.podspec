Pod::Spec.new do |spec|
spec.name = "AKGFramework"
spec.version = "1.0.0"
spec.summary = "AKG iOS Game Framework"
spec.homepage = "https://github.com/lutfi99/akgiosframework"
spec.license = { type: 'MIT', file: 'LICENSE' }
spec.authors = { "Lutfi Azhar" => 'lutfi@clappingape.com' }
spec.social_media_url = "https://github.com/lutfi99/akgiosframework"

spec.platform = :ios, "10.0"
spec.requires_arc = true
spec.source = { git: "https://github.com/lutfi99/akgiosframework.git", tag: "v#{spec.version}", submodules: true }
spec.source_files = "AKGFramework/**/*.{h,swift}"
end
