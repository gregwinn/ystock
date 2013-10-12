Gem::Specification.new do |s|
  s.name = 'ystock'
  s.version = "0.4.4"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Greg Winn"]
  s.date = %q{2012-06-09}
  s.description = %q{Grab stock information from Yahoo and Google Finance}
  s.email = %q{greg@winn.ws}
  s.extra_rdoc_files = ["README.markdown", "lib/ystock.rb"]
  s.files = ["README.markdown", "lib/ystock.rb","lib/ystock/yahoo.rb", "lib/ystock/google.rb", "ystock.gemspec"]
  s.homepage = %q{http://github.com/gregwinn/ystock}
  s.require_paths = ["lib"]
  s.summary = %q{Grab stock information from Yahoo and Google Finance}
  s.license = 'MIT'

  # => Other gem dependency
  s.add_dependency("httparty", "~> 0.10.1")
end
