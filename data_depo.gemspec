# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "data_depo"
  s.authors       = ["hosim"]
  s.email         = ["github.hosim@gmail.com"]
  s.description   = "DataDepo is data depository utility for testing, etc."
  s.summary       = "Data depository utility for testing, etc."
  s.homepage      = "https://github.com/hosim/data_depo"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version       = "0.0.2"
  s.license       = "MIT"

  s.add_development_dependency 'rspec'
end
