class House
  attr_reader :nouns, :verbs
  attr_accessor :index

  def initialize
    @nouns = ['the horse and the hound and the horn',
              'the farmer sowing his corn',
              'the rooster that crowed in the morn',
              'the priest all shaven and shorn',
              'the man all tattered and torn',
              'the maiden all forlorn',
              'the cow with the crumpled horn',
              'the dog',
              'the cat',
              'the rat',
              'the malt',
              'the house'
              ]
    @verbs = ['belonged to', 'kept', 'woke', 'married', 'kissed', 'milked', 'tossed', 'worried', 'killed', 'ate', 'lay', '']
    @index = verbs.size
  end

  def self.recite
    new.recite
  end

  def recite
    self.index -= 1
    return '' if index.negative?

    "#{index == verbs.size - 1 ? '' : "\n"}This is #{nouns[index]}" + strophe(index) + "\n" +  recite
  end

  def strophe(index)
    return '' if index > (nouns.size - 1)
    return " that Jack built." if index == (nouns.size - 1)

    "\nthat #{verbs[index]} #{index == nouns.size - 2 ? 'in ' : ''}#{nouns[index + 1]}" + strophe(index + 1)
  end
end

# p House.recite