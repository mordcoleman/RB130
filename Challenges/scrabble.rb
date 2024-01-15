require 'pry'
=begin
P: given a word, compute the Scrabble score
  i: string
  o: integer
   Use predetermined values in chart provided:
   A, E, I, O, U, L, N, R, S, T — 1 point
   D, G — 2 points
   B, C, M, P. — 3 points
   F, H, V, W, Y — 4 points
   K — 5 points
   J, X — 8 points
   Q, Z — 10 points

E: CABBAGE > total of 14 points
  We see that we need a Scrabble class with 3 methods:
   - A constructor method wich accepts a word (string)
   - score method, which iterates through the string and sums the score
     - invalid words return 0
     - words are case sensitive
   - A class method also named score that takes word as an argument and returns score

D: string > array > hash > integer

A:  - hash with number as key and letters as value

    - constructor method takes word
      - save word, upcased, as array of chars to var
      - verify that all chars are legit abc using regex or all values(helper)

    - verify helper method

    - score method
      - init counter to 0
      - verify that all chars are legit abc using regex or all values(helper)
      - iterate over array
        - at each index, find char in hash and add key to counter
      - return counter

     - class method use previous code
=end

class Scrabble
  attr_reader :word

  SCORES = {1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
            2 => ['D', 'G'], 3 => ['B', 'C', 'M', 'P'], 4=> ['F', 'H', 'V', 'W', 'Y'],
            5 => ['K'], 8 => ['J', 'X'], 10 => ['Q', 'Z']}
  def initialize(word)
    @word = word ? word : " "
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars
    counter = 0
    letters.each do |char|
      SCORES.each{|k, v| counter += k if v.include?(char)}
    end
    counter
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

cabbage = Scrabble.new('CABBAGE')
p cabbage.score
