# coding: utf-8

module DataDepo
  class ArrayData < Array
    class << self
      def gen(name, array)
        a = self[*array]
        nm = name.to_s.split('/').first
        mod = if nm.respond_to?(:camelize)
                nm.camelize
              else
                nm.split('_').map {|s| s.capitalize }.join
              end
        mod << 'Action'
        if DataDepo.const_defined?(mod)
          sig = class << a; self; end
          sig.__send__(:include, DataDepo.const_get(mod))
        end
        a
      end
    end
  end
end
