# coding: utf-8

module DataDepo
  class Loader
    def initialize(paths)
      roots = ::DataDepo.definition_path
      @paths = roots.map {|root|
        File.join(root, *paths.map {|path| path.to_s})
      }
      @paths = [File.join(*paths.map {|path| path.to_s})] if @paths.empty?
    end

    def load
    end

    attr_reader :paths
  end
end
