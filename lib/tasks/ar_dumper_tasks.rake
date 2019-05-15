namespace :db do
  desc 'Dump schema and data to db/schema.rb and db/data.yml'
  task(dump: ['db:schema:dump', 'db:data:dump'])

  desc 'Load schema and data from db/schema.rb and db/data.yml'
  task(restore: ['db:schema:load', 'db:data:load'])

  namespace :data do
    desc 'Dump contents of database to db/data.extension (defaults to yaml)'
    task dump: :environment do
      ARDumper::RakeTasks.data_dump_task
    end

    desc 'Dump contents of database to curr_dir_name/tablename.extension (defaults to yaml)'
    task dump_dir: :environment do
      ARDumper::RakeTasks.data_dump_dir_task
    end

    desc 'Load contents of db/data.extension (defaults to yaml) into database'
    task restore: :environment do
      ARDumper::RakeTasks.data_load_task
    end

    desc 'Load contents of db/data_dir into database'
    task restore_dir: :environment do
      ARDumper::RakeTasks.data_load_dir_task
    end
  end
end
