lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ecommerce/version'

Gem::Specification.new do |spec|
  spec.name          = "ecommerce-client"
  spec.version       = Ecommerce::VERSION
  spec.authors       = ["Rafael B. Tauil", "Eduardo Hertz", "Rodrigo Tassinari"]
  spec.email         = ["rafael@tauil.com.br", "eduardohertz@gmail.com", "rodrigo@pittlandia.net"]
  spec.summary       = %q{Official Ruby client for Myfreecomm's Ecommerce API.}
  spec.description   = %q{Official Ruby client for Myfreecomm's Ecommerce API. Ecommerce is a solution to control payments for your products.}
  spec.homepage      = "https://github.com/myfreecomm/ecommerce-client-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 0.7.1"
  spec.add_dependency "multi_json", "~> 1.11"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.2"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "vcr", "~> 2.9"
end
