# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_zero_stock_products'
  s.version     = '2.0.2'
  s.summary     = 'Restore show_zero_stock_products functionality in Spree 2.0+'
  s.description = 'Restore show_zero_stock_products functionality in Spree 2.0+'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Stefan Wrobel'
  s.email     = 'swrobel@gmail.com'
  s.homepage  = 'https://github.com/swrobel/spree_zero_stock_products'
  s.license   = 'MIT'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.5'
  s.add_dependency 'durable_decorator', '~> 0.2.0'

  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'durable_decorator_rails', '~> 0.1.0'
  s.add_development_dependency 'coveralls'
end
