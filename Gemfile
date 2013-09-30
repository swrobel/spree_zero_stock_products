source 'https://rubygems.org'

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'activerecord-jdbcmysql-adapter', github: 'jruby/activerecord-jdbc-adapter'
end

platforms :ruby do
  gem 'sqlite3'
  gem 'pg'
  gem 'mysql2'
end

gemspec
