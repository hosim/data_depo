# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "data_pitcher"
  s.authors       = ["hosim"]
  s.email         = ["github.hosim@gmail.com"]
  s.description   = ""
  s.summary       = ""
  s.homepage      = ""
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version       = "0.0.1"

  s.add_development_dependency 'rspec'
end
