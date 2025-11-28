# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

AR_VERSION = ENV['RAILS_VERSION'] || '~> 7.2'
SQLITE_VER = AR_VERSION.match(/[0-9\.]+/).to_s.to_f < 6.0 ? '1.3.0' : '1.4'

require 'activerecord_dumper/version'

Gem::Specification.new do |s|
  s.platform      = Gem::Platform::RUBY
  s.name          = 'activerecord_dumper'
  s.version       = ActiveRecordDumper::VERSION
  s.authors       = ['Adam Wiggins', 'Orion Henry', 'Serge Tkatchouk']
  s.summary       = 'activerecord_dumper allows you to dump/restore any ActiveRecord database to/from a YAML file.'
  s.description   = <<DESC_EOF
ActiveRecordDumper is a fork of YamlDb gem without any explicit Rails dependencies.  This way it can be used by any AR-enabled app (e.g. Sinatra) without pulling whole Rails in.
YamlDB/ActiveRecordDumper is a database-independent format for dumping and restoring data.  It complements the database-independent schema format found in db/schema.rb.  The data is saved into db/data.yml.
This can be used as a replacement for mysqldump or pg_dump, but it only supports features found in ActiveRecord-based (Rails, etc.) apps.  Users, permissions, schemas, triggers, and other advanced database features are not supported by design.
Any database that has an ActiveRecord adapter should work.
DESC_EOF
  s.homepage      = 'https://github.com/spijet/activerecord_dumper'
  s.license       = 'MIT'

  s.extra_rdoc_files = ['README.md']
  s.files = Dir['README.md', 'lib/**/*']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.3'

  s.add_runtime_dependency 'activerecord', '>= 3.2.22', '< 8.2'

  s.add_development_dependency 'bundler', '>= 1.14'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'sqlite3', '~> ' + SQLITE_VER
end
