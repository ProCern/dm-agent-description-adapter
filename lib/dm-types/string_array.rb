module DataMapper
  module Types
    class StringArray < DataMapper::Type
      primitive String

      def self.load(value, property)
        value
      end

      def self.dump(value, property)
        value
      end

      def self.typecast(value, property)
        value.kind_of?(::Array) ? value : load(value, property)
      end
    end
  end
end

