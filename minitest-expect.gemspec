Gem::Specification.new do |s|
  s.name          = 'minitest-expect'
  s.summary       = 'Expect syntax for minitest specs'
  s.authors       = ['Dave Jachimiak']
  s.email         = 'dave.jachimiak@gmail.com'
  s.homepage      = 'http://github.com/davejachimiak/minitest-expect'
  s.version       = '0.0.1'
  s.files         = `git ls-files`.split("\n").reject do |file_name|
    /\.gem$/.match file_name
  end
  s.require_paths = ['lib']
  s.platform      = Gem::Platform::RUBY
end
