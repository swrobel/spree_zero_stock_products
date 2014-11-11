source 'https://rubygems.org'

platforms :ruby do
  gem 'sqlite3'
  # The following 2 are only for TravisCI
  gem 'pg' if ENV['DB'] == 'postgres'
  gem 'mysql2' if ENV['DB'] == 'mysql'
end

gemspec
