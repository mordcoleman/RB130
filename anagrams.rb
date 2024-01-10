=begin
P: take a word and list of possible anagrams, return sublist of those that are
   contained in word
   i: string, array
   o: array
   rules: anagrams must (a) be the same length, (b) have the same exact letters,
          and (c) have the exact same number of the exact same letters.
          Letters cannot be reused. Additionally, a word is not an anagram of itself
          (e.g. corn is not an anagram of corn).
          Anagrams are not case sensitive -- Orchestra and Carthorse are anagrams
          of each other.

E: given the word "listen" and a list of candidates like "enlists", "google",
   "inlets", and "banana", the program should return a list containing "inlets"

  We can see that we'll need a Angram class, with 2 methods:
    - a constructor that takes the pattern word as an argument
    - a match method that takes a list of words as an argument
      (to test against the pattern we initialized in the constructor)

D: strings > array

A: (sorting seems to be key here)

   - constuctor method, takes string and array
    - save each to var

   - match method
     - iterate over each word in list (select?)
     - return if word size equal to given word size & word is NOT the same as given word
       & word sorted and downcased matches given word sorted and downcased
=end

class Anagram
  attr_reader :original, :list

  def initialize(word, list)
    @original = word
    @list = list
  end

  def anagrams
    list.select do |word|
      word.size == original.size && word != original && word.downcase.chars.sort.join == original.downcase.chars.sort.join
    end
  end
end

first = Anagram.new('listen', ["enlists", "google", "inlets", "banana"])
p first.anagrams

=begin LS Solution better, word an list are properly seperated, and has helper methods
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
