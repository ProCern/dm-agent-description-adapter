module DataMapper
  module Types
    class ChoiceList < DataMapper::Type
      primitive String

      def self.load(value, property)
        return nil unless value
        choices = []
        value.xpath('choice').each do |choice|
          choices << Choice.new(choice.child.to_s,
                                choice['value'])
        end
        choices
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

class Choice
  attr_accessor :title, :value

  def initialize(title, value)
    @title, @value = title, value
  end
end


