# coding: utf-8

require 'data_depo/array_data'

module DataDepo
  class Query
    include Enumerable

    def initialize(name=nil, path=[])
      @name = name
      @path = path
    end

    def [](*keys)
      raise if keys.empty?

      @name ||= keys.first
      path = (@path || []) | keys
      self.class.new(@name, path)
    end

    def each(&block)
      data = DataDepo.current_loader.new(@path).load
      data.each(&block)
    end

    def files
      loader = DataDepo.current_loader.new(@path)
      loader.files
    end

    private
    def method_missing(name, *args, &block)
      loader = DataDepo.current_loader.new(@path)
      unless loader.files.empty?
        a = ArrayData.gen(@name, loader.load)
        return a.respond_to?(name) ? a.__send__(name, *args, &block) : super
      end
      super
    end
  end
end
