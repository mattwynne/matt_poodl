# Feel free to delete the instructions once you get going
puts instructions(__FILE__)

class Bottles

  def verses(first, last)
    (last..first).map { |i| verse(i) }.reverse.join("\n")
  end

  def song
    verses(99, 0)
  end

  def verse(number_of_bottles)
    "#{count(number_of_bottles).capitalize} #{container(number_of_bottles)} of beer on the wall, " +
      "#{count(number_of_bottles)} #{container(number_of_bottles)} of beer.\n" + 
      "#{action(number_of_bottles)}, " +
      "#{count(remainder(number_of_bottles))} #{container(remainder(number_of_bottles))} of beer on the wall.\n"
  end

  private

  def action(number_of_bottles)
    return "Go to the store and buy some more" if number_of_bottles == 0
    "Take #{pronoun(number_of_bottles)} down and pass it around"
  end

  def pronoun(number_of_bottles)
    return 'it' if number_of_bottles == 1
    'one'
  end

  def remainder(number_of_bottles)
    return 99 if number_of_bottles == 0
    number_of_bottles-1
  end

  def count(number_of_bottles)
    return 'no more' if number_of_bottles == 0
    number_of_bottles.to_s
  end

  def container(number_of_bottles)
    return 'bottle' if number_of_bottles == 1
    'bottles'
  end

end
