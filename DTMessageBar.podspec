Pod::Spec.new do |spec|
  spec.name = "DTMessageBar"
  spec.version = "1.1.3"
  spec.summary = "Simple message bar"
  spec.homepage = "https://github.com/danjiang/DTMessageBar"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dan Jiang" => 'danjiang5956@gmail.com' }
  spec.social_media_url = "https://twitter.com/danjianglife"

  spec.platform = :ios, "8.4"
  spec.requires_arc = true
  spec.swift_version = '4.0'
  spec.source = { git: "https://github.com/danjiang/DTMessageBar.git", tag: spec.version, submodules: true }
  spec.source_files = "Sources/**/*.{h,swift}"
  spec.resources = "Sources/*.bundle"
end
