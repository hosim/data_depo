# coding: utf-8

module DataPitcher
  class Category
    def initialize
      @key_items = {}
      @path_items = {}
    end

    def register(item, key)
      hash = key.is_a?(Array) ? @path_items : @key_items
      hash[key] = item
    end

    def has?(key)
      hash = key.is_a?(Array) ? @path_items : @key_items
      hash.has_key?(key)
    end
  end
end
