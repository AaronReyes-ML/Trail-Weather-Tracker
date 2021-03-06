# -*- encoding: utf-8 -*-
# stub: flay 2.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "flay"
  s.version = "2.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ryan Davis"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDijCCAnKgAwIBAgIBATANBgkqhkiG9w0BAQUFADBFMRMwEQYDVQQDDApyeWFu\nZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB\nGRYDY29tMB4XDTE2MDkyNjAxNTczNVoXDTE3MDkyNjAxNTczNVowRTETMBEGA1UE\nAwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS\nJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda\nb9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx\ntaCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT\noOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh\nGiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt\nqhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV\ngBEfoTEGr7Zii72cx+sCAwEAAaOBhDCBgTAJBgNVHRMEAjAAMAsGA1UdDwQEAwIE\nsDAdBgNVHQ4EFgQUR8V72Z3+v+2P9abCnL4wjx32T+EwIwYDVR0RBBwwGoEYcnlh\nbmQtcnVieUB6ZW5zcGlkZXIuY29tMCMGA1UdEgQcMBqBGHJ5YW5kLXJ1YnlAemVu\nc3BpZGVyLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAIGzgp0aZ2W9+v96ujmBcQHoC\nbuy0iU68MVj2VlxMyfr1KPZIh1OyhU4UO4zrkREcH8ML70v9cYHNvOd9oynRHnvC\nl2tj/fD3YJ0AEkJxGrYwRWQmvMfC4bJ02bC1+rVOUIXXKp3+cUmiN4sTniof8VFo\nbo/YYP4c7erpERa+9hrqygg6WQbJlk2YRlH3JXPFjmu869i2dcbR5ZLOAeEy+axH\nE4oJcnPkJAr0rw504JGtlZtONZQblwmRJOIdXzolaE3NRGUzGVOUSptZppAKiavY\nfO6tdKQc/5RfA8oQEkg8hrxA5PQSz4TOFJGLpFvIapEk6tMruQ0bHgkhr9auXg==\n-----END CERTIFICATE-----\n"]
  s.date = "2017-04-14"
  s.description = "Flay analyzes code for structural similarities. Differences in literal\nvalues, variable, class, method names, whitespace, programming style,\nbraces vs do/end, etc are all ignored. Making this totally rad."
  s.email = ["ryand-ruby@zenspider.com"]
  s.executables = ["flay"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "bin/flay"]
  s.homepage = "http://ruby.sadi.st/"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.txt"]
  s.rubygems_version = "2.5.1"
  s.summary = "Flay analyzes code for structural similarities"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sexp_processor>, ["~> 4.0"])
      s.add_runtime_dependency(%q<ruby_parser>, ["~> 3.0"])
      s.add_runtime_dependency(%q<erubis>, ["~> 2.7.0"])
      s.add_runtime_dependency(%q<path_expander>, ["~> 1.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.8.0"])
      s.add_development_dependency(%q<ruby2ruby>, ["~> 2.2.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.16"])
    else
      s.add_dependency(%q<sexp_processor>, ["~> 4.0"])
      s.add_dependency(%q<ruby_parser>, ["~> 3.0"])
      s.add_dependency(%q<erubis>, ["~> 2.7.0"])
      s.add_dependency(%q<path_expander>, ["~> 1.0"])
      s.add_dependency(%q<minitest>, ["~> 5.8.0"])
      s.add_dependency(%q<ruby2ruby>, ["~> 2.2.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.16"])
    end
  else
    s.add_dependency(%q<sexp_processor>, ["~> 4.0"])
    s.add_dependency(%q<ruby_parser>, ["~> 3.0"])
    s.add_dependency(%q<erubis>, ["~> 2.7.0"])
    s.add_dependency(%q<path_expander>, ["~> 1.0"])
    s.add_dependency(%q<minitest>, ["~> 5.8.0"])
    s.add_dependency(%q<ruby2ruby>, ["~> 2.2.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.16"])
  end
end
