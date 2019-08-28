class House
  @house = 'in the house that Jack built.'
  @nouns = ['horse and the hound and the horn',
            'farmer sowing his corn',
            'rooster that crowed in the morn',
            'priest all shaven and shorn',
            'man all tattered and torn',
            'maiden all forlorn',
            'cow with the crumpled horn',
            'dog',
            'cat',
            'rat',
            'malt'
            ]
  @verbs = ['belonged to', 'kept', 'woke', 'married', 'kissed', 'milked', 'tossed', 'worried', 'killed', 'ate', 'lay']
  @index = @verbs.size

  def self.recite
    @index -= 1
    noun = @nouns[@index]
    return '' if @index.negative?
    index_strophe = @index
    "This is the house that Jack built.\n\n" + "This is the #{noun}\n" + self.strophe(index_strophe) +
    "that lay #{@house}\n" + self.recite
  end

  def self.strophe(index)
    return '' if index >= (@nouns.size - 1)
    "that #{@verbs[index]} the #{@nouns[index + 1]}\n" + self.strophe(index + 1)
  end
end

# p House.recite