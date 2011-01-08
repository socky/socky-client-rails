# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{socky-client-rails}
  s.version = "0.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bernard Potocki"]
  s.date = %q{2010-11-04}
  s.description = %q{Socky is a WebSocket server and client for Ruby}
  s.email = %q{bernard.potocki@imanel.org}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
     "README.md",
     "Rakefile",
     "VERSION",
     "assets/socky_hosts.yml",
     "generators/socky/socky_generator.rb",
     "generators/socky/templates/socky.rake",
     "init.rb",
     "lib/socky-client-rails.rb",
     "lib/socky-client-rails/helper.rb",
     "lib/socky-client-rails/java_script_generator.rb",
     "lib/socky-client-rails/railtie.rb",
     "lib/tasks/socky-client-rails.rake",
     "spec/socky-client-rails_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/config.rb",
     "spec/support/config/socky_hosts.yml"
  ]
  s.homepage = %q{http://imanel.org/projects/socky}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Socky is a WebSocket server and client for Ruby}
  s.test_files = [
    "spec/socky-client-rails_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/config.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<socky-client>, ["~> 0.4.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
    else
      s.add_dependency(%q<socky-client>, ["~> 0.4.2"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<socky-client>, ["~> 0.4.2"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
  end
end

