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
      return None.new if number == 0
      return One.new if number == 1
      Default.new(number)
    end

    class Default
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
        "#{@number_of_bottles} #{container}"
      end

      private

      def container
        'bottles'
      end
    end

    class One
      def action
        'Take it down and pass it around'
      end

      def remainder
        None.new
      end

      def to_s
        '1 bottle'
      end
    end

    class None
      def action
        'Go to the store and buy some more'
      end

      def remainder
        BottleQuantity.new(99)
      end

      def to_s
        'no more bottles'
      end
    end
  end

end
