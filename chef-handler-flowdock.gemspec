Gem::Specification.new do |s|
  s.name = 'chef-handler-flowdock'
  s.version = '0.1'
  s.platform = Gem::Platform::RUBY
  s.summary = "A Chef handler that collects exception and report handler data and reports it to Flowdock, a web-based team inbox and chat tool."
  s.description = s.summary
  s.author = "Matthias Marschall"
  s.email = "mm@agileweboperations.org"
  s.homepage = "https://github.com/mmarschall/chef-handler-flowdock"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")

  s.add_runtime_dependency 'flowdock', '>= 0.2.2'
end
