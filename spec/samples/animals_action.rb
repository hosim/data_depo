# -*- coding: utf-8 -*-

module DataDepo
  module AnimalsAction
    def custom_action_a
      self.each.inject({}) {|h, animal|
        key = animal["species"].to_sym
        h[key] ||= []
        h[key] << animal["name"]
        h
      }
    end
  end
end
