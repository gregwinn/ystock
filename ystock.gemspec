Gem::Specification.new do |s|
  s.name = %q{ystock}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Greg Winn"]
  s.date = %q{2012-06-09}
  s.description = %q{Grab stock information from Yahoo Finance and Google}
  s.email = %q{greg@winn.ws}
  s.extra_rdoc_files = ["README.markdown", "lib/ystock.rb"]
  s.files = ["README.markdown", "lib/ystock.rb","lib/ystock/yahoo.rb", "lib/ystock/google.rb", "ystock.gemspec"]
  s.homepage = %q{http://github.com/gregwinn/ystock}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ystock", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ystock}
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Grab stock information from Yahoo Finance and Google}
end
