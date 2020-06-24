Gem::Specification.new do |spec|
  spec.name          = "lita-uptimerobot"
  spec.version       = "0.1.1"
  spec.authors       = ["Jurnell Cockhren"]
  spec.email         = ["opensource@civichacker.com"]
  spec.summary       = %q{Lita Handler for interacting with uptimerobot.com}
  spec.description   = <<-EOF
  Originally built in 2015, this plugin intendes to help DevOps teams incorportate the UpTime Robot monitoring solution into their ChatOps.

  Civic Hacker has not affilitation with the company the runs UpTimeRobot. We just throught it would be useful to the community.
  EOF
  spec.homepage      = "https://github.com/civichacker/lita-uptimerobot"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 12.3", ">= 12.3.3"
  spec.add_development_dependency "rack-test", "~> 0"
  spec.add_development_dependency "rspec", "~> 3.0", ">= 3.0.0"
end
