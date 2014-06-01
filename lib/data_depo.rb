# coding: utf-8

require 'data_depo/query'
require 'data_depo/yaml_loader'

module DataDepo
  class << self
    def definition_path=(paths)
      @definition_paths = Array(paths)
    end

    def definition_path
      @definition_paths
    end

    def current_loader
      @loader = YAMLLoader
    end

    def method_missing(name, *args, &block)
      return super if name.to_s[-1] == '='

      query ||= Query.new
      if name == :[]
        query.__send__(name, *args, &block)
      else
        query = query.__send__(:[], name)
        query = query[*args] unless args.empty?
        query
      end
    end
  end
end
