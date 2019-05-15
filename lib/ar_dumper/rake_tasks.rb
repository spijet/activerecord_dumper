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
      if APP_DIR
        "#{APP_DIR}/db#{dir}"
      elsif ENV['APP_DIR']
        "#{ENV['APP_DIR']}/db#{dir}"
      elsif ENV['APP_ROOT']
        "#{ENV['APP_ROOT']}/db#{dir}"
      elsif defined? Rails
        "#{Rails.root}/db#{dir}"
      end
    end

    def self.helper
      format_class = ENV['class'] || 'ARDumper::Helper'
      format_class.constantize
    end

    private_class_method :default_dir_name, :db_dump_data_file,
                         :dump_dir, :helper
  end
end
