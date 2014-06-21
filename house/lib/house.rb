# Feel free to delete the instructions once you get going
puts instructions(__FILE__)

class House
  def recite
    (1..12).map { |n| line(n) }.join("\n")
  end

  def line(number)
    "This is #{build_line(number)}\n"
  end

  def build_line(number)
    lines = [
      "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate",
      "the malt that lay in",
      "the house that Jack built."
    ]
    return lines.last if number == 1
    lines[lines.length - number] + " " + build_line(number - 1)
  end
end
