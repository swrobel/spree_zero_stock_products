source 'https://rubygems.org'

platforms :ruby_19, :jruby do
  gem 'mime-types', '2.99.1'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  # The following 2 are only for TravisCI
  gem 'activerecord-jdbcpostgresql-adapter' if ENV['DB'] == 'postgres'
  gem 'activerecord-jdbcmysql-adapter' if ENV['DB'] == 'mysql'
end

platforms :ruby do
  gem 'sqlite3'
  # The following 2 are only for TravisCI
  gem 'pg' if ENV['DB'] == 'postgres'
  gem 'mysql2', '~> 0.3.20' if ENV['DB'] == 'mysql'
end

gemspec
