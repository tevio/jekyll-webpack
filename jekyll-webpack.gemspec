require_relative 'lib/jekyll/webpack/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-webpack"
  spec.version       = Jekyll::Webpack::VERSION
  spec.authors       = ["Steve Martin"]
  spec.email         = ["steve@martian.media"]

  spec.summary       = %q{Compile assets with webpack}
  spec.description   = %q{Once Jekyll has built your sites HTML, run webpack against the compiled _site}
  spec.homepage      = "https://github.com/tevio/jekyll-webpack"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = 'http://rubygems.org'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mml/jekyll-webpack"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll"
  spec.add_dependency "listen"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
