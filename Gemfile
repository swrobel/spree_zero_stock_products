source 'https://rubygems.org'

# Need to use this patch until my fix for jruby/mysql is accepted
gem 'spree_core', github: 'swrobel/spree', branch: 'patch-2'

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'activerecord-jdbcmysql-adapter'
end

platforms :ruby do
  gem 'sqlite3'
  gem 'pg'
  gem 'mysql2'
end

gemspec
