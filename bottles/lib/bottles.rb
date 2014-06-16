require 'forwardable'

class Bottles

  def verses(first, last)
    (last..first).map { |i| verse(i) }.reverse.join("\n")
  end

  def song
    verses(99, 0)
  end

  def verse(n)
    number_of_bottles = BottleQuantity.new(n)
    "#{number_of_bottles.to_s.capitalize} of beer on the wall, " +
      "#{number_of_bottles} of beer.\n" + 
      "#{number_of_bottles.action}, " +
      "#{number_of_bottles.remainder} of beer on the wall.\n"
  end

  module BottleQuantity

    def self.new(number)
      @special_cases.fetch(number) { Several.new(number) }
    end

    def self.special_case(number, &block)
      @special_cases ||= {}
      @special_cases[number] = Class.new(&block).new
    end

    class Several
      def initialize(number_of_bottles)
        @number_of_bottles = number_of_bottles
      end

      def action
        "Take one down and pass it around"
      end

      def remainder
        BottleQuantity.new(@number_of_bottles - 1)
      end

      def to_s
        "#{@number_of_bottles} bottles"
      end
    end

    special_case(1) do
      def action
        'Take it down and pass it around'
      end

      def remainder
        BottleQuantity.new(0)
      end

      def to_s
        '1 bottle'
      end
    end

    special_case(0) do
      def action
        'Go to the store and buy some more'
      end

      def remainder
        Several.new(99)
      end

      def to_s
        'no more bottles'
      end
    end

    special_case(6) do
      def action
        'Take it down and pass it around'
      end

      def remainder
        BottleQuantity.new(5)
      end

      def to_s
        '1 six-pack'
      end
    end
  end

end
