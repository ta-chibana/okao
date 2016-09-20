module Okao
  class Emoticon
    class << self
      def init(okaos)
        okaos.each_with_index do |face, index|
          var_name = "@face#{index}"
          instance_variable_set(var_name, face)

          define_singleton_method(var_name[1..-1]) do
            instance_variable_get(var_name)
          end
        end
      end

      def to_h
        instance_variables.reduce({}) do |acc, cur|
          var_name = cur.to_s[1..-1]
          hash = { var_name.to_sym => self.send(var_name) }
          acc.merge(hash)
        end
      end
    end
  end
end
