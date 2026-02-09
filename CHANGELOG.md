## activerecord_dumper 0.9.1

* Add direct require for "logger" (fixes AR 6.x and 7.0 tests);
* Switch CI stack to SimpleCov + Coveralls + GitHub Actions;

## activerecord_dumper 0.9.0

**Breaking Changes:**

* Minimum Ruby version requirement raised to 2.3+;
* Gem files and modules renamed to follow proper naming conventions;

**Changes:**

* Add support for ActiveRecord 7.1 up to 8.1;
* Relax SQLite3 version requirements;
* Improve logic for SQLite3 version constraints based on ActiveRecord version
  used (42accc6);
* Fix weird YAML serialization bug (2076cd6);

## activerecord_dumper 0.8.0g

* Add support for Ruby versions 2.7 up until 3.1;
* Add support for Rails/AR 6.1 and 7.0;

## activerecord_dumper 0.8.0f

* Try to support different SQLite3 versions depending on ActiveRecord version
  used;
* Support newer Bundler versions;

## activerecord_dumper 0.8.0e

* Add support for ActiveRecord 6.0;

## activerecord_dumper 0.8.0d

* Add Coveralls for code coverage;
* Restore `load` keyword (instead of `restore`) for consistency;
* Remove unnecessary trailing newline in YAML output;
* Rework app root dir guessing;
* Add License file (MIT);

## activerecord_dumper 0.8.0b/c

* Fix Gemspec load path issue;

## activerecord_dumper 0.8.0a

**Breaking Changes:**

* Gem renamed from `yaml_db` to `activerecord_dumper`;
* Removed hard Rails dependency — now works with standalone ActiveRecord;

## yaml_db 0.7.0

* Support Rails 5.2 and Ruby 2.5

## yaml_db 0.6.0

* Add Rails 5.1 support
* Fix a bug that caused errors when dumping HABTM tables

## yaml_db 0.5.0

* Order HABTM tables using both IDs (@mauriciopasquier)

## yaml_db 0.4.2

* Use Windows-compatible directory names
* Sort tables in the dump so that two dumps can reliably be diffed

## yaml_db 0.4.1

Version skipped due to developer error

## yaml_db 0.4.0

* Put everything under the YamlDb module namespace
* Add Rails 5.0 support

## yaml_db 0.3.0

* Add Rails 4.x support
* Restore Rails 3.0 compatibility
* Test against all supported Rails versions

## yaml_db 0.2.3

* Support Rails 3.2
