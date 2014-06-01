# coding: utf-8

require "data_pitcher/holder"

module DataPitcher
  class << self
    def definiton_paths=(paths)
      @definition_paths = Array(paths)
    end

    def load
      (@definition_paths || []).uniq.each do |path|
        if File.directory?(path)
          Dir.glob(File.join(path, '**', '*.yml')).each do |file|
            Holder.add(file, path)
          end
        end
      end
    end

    def throw(name, key)
      item = Holder.select(name.to_s)
    end
  end
end
