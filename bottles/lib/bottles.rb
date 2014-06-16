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
    "#{number_of_bottles.to_s.capitalize} #{number_of_bottles.container} of beer on the wall, " +
      "#{number_of_bottles} #{number_of_bottles.container} of beer.\n" + 
      "#{number_of_bottles.action}, " +
      "#{number_of_bottles.remainder} #{number_of_bottles.remainder.container} of beer on the wall.\n"
  end

  class BottleQuantity

    def initialize(number_of_bottles)
      @number_of_bottles = number_of_bottles
    end

    def action
      return "Go to the store and buy some more" if @number_of_bottles == 0
      "Take #{pronoun} down and pass it around"
    end

    def remainder
      return self.class.new(99) if @number_of_bottles == 0
      self.class.new(@number_of_bottles - 1)
    end

    def to_s
      return 'no more' if @number_of_bottles == 0
      @number_of_bottles.to_s
    end

    def container
      return 'bottle' if @number_of_bottles == 1
      'bottles'
    end

    private

    def pronoun
      return 'it' if @number_of_bottles == 1
      'one'
    end
  end

end
