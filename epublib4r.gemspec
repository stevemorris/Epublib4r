# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "epublib4r/version"

Gem::Specification.new do |s|
  s.name        = "epublib4r"
  s.version     = Epublib4r::VERSION
  s.authors     = ["Steve Morris"]
  s.email       = ["github@stevemorris.com"]
  s.homepage    = "https://github.com/stevemorris/s9-e1"
  s.summary     = %q{Ruby wrapper for the Epublib library}
  s.description = %q{Ruby wrapper for the Epublib java library}

  s.rubyforge_project = "epublib4r"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
end
