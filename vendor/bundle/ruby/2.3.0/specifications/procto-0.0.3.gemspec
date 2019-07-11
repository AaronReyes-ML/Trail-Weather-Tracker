# -*- encoding: utf-8 -*-
# stub: procto 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "procto"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Martin Gamsjaeger (snusnu)"]
  s.date = "2016-02-29"
  s.description = "Turns your object into a method object"
  s.email = ["gamsnjaga@gmail.com"]
  s.extra_rdoc_files = ["LICENSE", "README.md", "CONTRIBUTING.md"]
  s.files = ["CONTRIBUTING.md", "LICENSE", "README.md"]
  s.homepage = "https://github.com/snusnu/procto"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Defines Foo.call(*args) which invokes Foo.new(*args).bar"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1"])
    else
      s.add_dependency(%q<bundler>, ["~> 1"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1"])
  end
end
