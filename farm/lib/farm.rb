# Feel free to delete the instructions once you get going
puts instructions(__FILE__)

class Farm
  def initialize(ids)
    @ids = ids
  end

  def lyrics
    animals.map { |animal|
    %{Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had #{articleify(animal.species)}, E-I-E-I-O,
With #{articleify(animal.sound)} #{animal.sound} here and #{articleify(animal.sound)} #{animal.sound} there,
Here #{articleify(animal.sound)}, there #{articleify(animal.sound)}, everywhere #{articleify(animal.sound)} #{animal.sound},
Old MacDonald had a farm, E-I-E-I-O.}
    }.join("\n\n")
  end

  private

  def animals
    Animal.all(@ids)
  end

  def articleify(noun)
    "#{article(noun)} #{noun}"
  end

  def article(noun)
    if noun.match(/^[aeiou]/)
      'an'
    else
      'a'
    end
  end
end
