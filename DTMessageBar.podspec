Pod::Spec.new do |spec|
  spec.name = "DTMessageBar"
  spec.version = "1.1.2"
  spec.summary = "Simple message bar"
  spec.homepage = "https://github.com/danjiang/DTMessageBar"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dan Jiang" => 'dan@danthought.com' }
  spec.social_media_url = "http://twitter.com/dtstudio"

  spec.platform = :ios, "8.4"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/danjiang/DTMessageBar.git", tag: spec.version, submodules: true }
  spec.source_files = "Sources/**/*.{h,swift}"
  spec.resources = "Sources/*.bundle"
end
