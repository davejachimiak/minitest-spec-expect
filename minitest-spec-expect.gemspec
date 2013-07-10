# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = 'minitest-spec-expect'
  s.description   = 'Expect syntax for minitest specs.'
  s.summary       = 'Use the expect syntax with transposed minitest expectations.'
  s.authors       = ['Dave Jachimiak']
  s.email         = 'dave.jachimiak@gmail.com'
  s.homepage      = 'http://github.com/davejachimiak/minitest-spec-expect'
  s.version       = '0.1.2'
  s.files         = `git ls-files`.split("\n").reject do |file_name|
    /\.gem$/.match file_name
  end
  s.test_files    = `git ls-files -- spec`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'rake'
end
