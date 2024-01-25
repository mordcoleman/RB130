=begin
P: Take a word and a list of words and returns a sublist of anagrams of given word
  rules: - An anagram is a different word mad up of the same letters
         - The same word doesn't count
         - return empty array if no matches
         - anagrams are case insensitive

E: listen, ["enlists", "google", "inlets", "banana"] = 'inlets'
    based  on test suite, see rules ^
    - match method
D:

A:  - create Anagram class
      - initialize takes string, saves it

    - create match method, takes array
      - check if array has same word, if so, delete
      - iterate over array, select each word that is the same original word
        when both  are sorted and downcased, and converted to array
      - return selected array
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    array.delete_if {|word| word.downcase == @word.downcase}

    array.select do |element|
      element.downcase.chars.sort == @word.downcase.chars.sort
    end
  end
end

=begin LS Solution
class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |ana|
      ana.downcase != word && anagram?(ana, word)
    end
  end

  private

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end
=end
