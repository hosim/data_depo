# coding: utf-8
require 'yaml'
require 'data_depo/loader'

module DataDepo
  class YAMLLoader < Loader
    def load
      files.each.inject([]) {|a, file|
        load_file_into_array(file, a); a
      }
    end

    def files
      @paths.each.inject([]) do |a, path|
        Dir.glob(File.join(path, '**', '*.yml')) {|file|
          a << file
        } if File.directory?(path)

        filename = path + '.yml'
        a << filename if File.file?(filename)
        a
      end
    end

    private
    def load_file_into_array(file, array)
      yaml = YAML.load_file(file)
      if yaml.is_a? Array
        array.concat(yaml)
      else
        array << yaml
      end
    end
  end
end
