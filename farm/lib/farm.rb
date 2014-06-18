# Feel free to delete the instructions once you get going
puts instructions(__FILE__)

class Farm
  def initialize(ids)
    @ids = ids
  end

  def lyrics
    animals.map { |animal|
      if animal
        species = animal.species
        sound = animal.sound
      else
        species = '<silence>'
        sound = '<silence>'
      end
    %{Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had #{articleify(species)}, E-I-E-I-O,
With #{articleify(sound)} #{sound} here and #{articleify(sound)} #{sound} there,
Here #{articleify(sound)}, there #{articleify(sound)}, everywhere #{articleify(sound)} #{sound},
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
