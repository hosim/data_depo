# coding: utf-8

module DataDepo
  class ArrayData < Array
    class << self
      def gen(name, array)
        a = self[*array]
        nm = name.to_s.split('/').first
        mod = action_module(nm)
        (class << a; self; end).__send__(:include, mod) if mod
        a
      end

      private
      def action_module(name)
        nm = if name.respond_to?(:camelize)
               name.camelize
             else
               name.split('_').map {|s| s.capitalize }.join
             end
        nm << 'Action'
        DataDepo.const_defined?(nm) ? DataDepo.const_get(nm) : nil
      end
    end
  end
end
