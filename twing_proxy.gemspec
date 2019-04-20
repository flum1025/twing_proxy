lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twing_proxy/version'

Gem::Specification.new do |spec|
  spec.name          = 'twing_proxy'
  spec.version       = TwingProxy::VERSION
  spec.authors       = ['flum1025']
  spec.email         = ['flum.1025@gmail.com']
  spec.summary       = 'Proxy for Twing'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/flum1025/twing_proxy'
  spec.license       = 'MIT'
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_dependency 'rest-client'
end
