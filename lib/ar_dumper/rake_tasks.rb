module ARDumper
  module RakeTasks
    def self.data_dump_task
      SerializationHelper::Base.new(helper).dump(db_dump_data_file(helper.extension))
    end

    def self.data_dump_dir_task
      dir = ENV['dir'] || default_dir_name
      SerializationHelper::Base.new(helper).dump_to_dir(dump_dir("/#{dir}"))
    end

    def self.data_load_task
      SerializationHelper::Base.new(helper).load(db_dump_data_file(helper.extension))
    end

    def self.data_load_dir_task
      dir = ENV['dir'] || 'base'
      SerializationHelper::Base.new(helper).load_from_dir(dump_dir("/#{dir}"))
    end

    # Private class methods below.

    def self.default_dir_name
      Time.now.strftime('%FT%H%M%S')
    end

    def self.db_dump_data_file(extension = 'yml')
      "#{dump_dir}/data.#{extension}"
    end

    def self.dump_dir(dir = '')
      "#{root_dir}/db#{dir}"
    end

    def self.root_dir
      return Rails.root if defined? Rails
      return APP_DIR if defined? APP_DIR
      return APP_ROOT if defined? APP_ROOT

      if ENV.key? 'APP_DIR'
        ENV['APP_DIR']
      elsif ENV.key? 'APP_ROOT'
        ENV['APP_ROOT']
      end
    end

    def self.helper
      format_class = ENV['class'] || 'ARDumper::Helper'
      format_class.constantize
    end

    private_class_method :default_dir_name, :db_dump_data_file,
                         :dump_dir, :root_dir, :helper
  end
end
