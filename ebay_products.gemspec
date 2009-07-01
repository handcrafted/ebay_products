# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ebay_products}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Owens"]
  s.date = %q{2009-07-01}
  s.email = %q{joshua.owens@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "ebay_products.gemspec",
     "lib/ebay_products.rb",
     "lib/ebay_products/data.rb",
     "spec/ebay_products_spec.rb",
     "spec/samples/failure.xml",
     "spec/samples/harry_potter.xml",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/handcrafted/ebay_products}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Wrapper for eBay web services}
  s.test_files = [
    "spec/ebay_products_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.2.2"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.3"])
      s.add_dependency(%q<activesupport>, [">= 2.2.2"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.3"])
    s.add_dependency(%q<activesupport>, [">= 2.2.2"])
  end
end
