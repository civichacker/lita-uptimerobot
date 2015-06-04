Gem::Specification.new do |spec|
  spec.name          = "lita-uptimerobot"
  spec.version       = "0.1.0-beta"
  spec.authors       = ["Jurnell Cockhren"]
  spec.email         = ["jurnell@sophicware.com"]
  spec.description   = %q{Lita Handler for interacting with uptimerobot.com}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/sophicware/lita-uptimerobot"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
