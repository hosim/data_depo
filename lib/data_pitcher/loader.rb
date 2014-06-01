# coding: utf-8

require 'yaml'

module DataPitcher
  module Loader
    class << self
      def load(path, root)
        pieces = path[root.length..-1].split('/')
        name = pieces.pop[0...((File.extname(path) + 1) * -1)]
        category = pieces.shift
        category = pieces.shift if category and category.empty?
        category ||= name
        breadcrumb = Array[*(pieces || []), name]
        data = YAML.load_fie(path)

        DataItem.new(category, name, breadcrumb, data)
      end
    end

    DataItem = Struct.new(:category, :name, :breadcrumb, :data)
  end
end
