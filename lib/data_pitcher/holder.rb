# coding: utf-8

require 'yaml'
require 'data_pitcher/category'
require 'data_pitcher/loader'

module DataPitcher
  class Holder
    class << self
      def add(path, root)
        item = Loader.load(path, root)
        category = (items[item.category] ||= Category.new)
        category.register(item.data, item.name) unless category.has?(item.name)
        category.register(item.data, item.pieces)
      end

      def keys
        items.keys
      end

      def select(category)
        items[category]
      end

      private :new
      private
      def items
        @items ||= {}
      end
    end

    attr_reader :category, :name, :pieces, :data

    def initialize(path, root)
      @path = path
      pieces = path[root.length..-1].split('/')
      @name = pieces.pop[0...-4]
      @category = pieces.shift
      @category = pieces.shift if @category and @category.empty?
      @name ||= @name
      @pieces = Array[*(pieces || []), @name]
      @data = YAML.load_file(@path)
    end
  end
end
