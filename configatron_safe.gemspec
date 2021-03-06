# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "configatron_safe/version"

Gem::Specification.new do |s|
  s.name        = "configatron_safe"
  s.version     = ConfigatronSafe::VERSION
  s.authors     = ["toshiwo"]
  s.email       = ["toshiwo@toshiwo.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "configatron_safe"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rr"
  s.add_development_dependency "simplecov"

  s.add_runtime_dependency "configatron"
end
