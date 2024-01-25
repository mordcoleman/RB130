=begin
P: Given a word, compute it's Scrabble score
  - use gicen chart to sum each letter, return score
  - a whitespace character, space or nil is 0
  - case insensitive

E: CABBAGE == 14

D: hash for letters and values -> string -> array for word chars -> integer

A: - create Scrabble class
   - create hash of letters & values
   - create initialize method, takes string, saves as array of chars, upcased, or
     nil if nil
   - create score method
     - init tally var to 0
     - return tally if nil
     - iterate over array of chars
       - if char is included in key list (i.e. it's a letter), return it's value
         and add to tally
       - if not, next
     - return tally
   - create score class method, use instance method
=end
class Scrabble
  SCORING = {%w(A E I O U L N R S T) => 1,
             %w(, G) => 2,
             %w(B C M P) => 3,
             %w(F H V W Y) => 4,
             %w(K) => 5,
             %w(J X) => 8,
             %w(Q Z) => 10 }
  def initialize(word)
    @array = (word == nil ?  nil: word.upcase.chars)
  end

  def score
    tally = 0
    return tally if @array == nil

    @array.each do |char|
      SCORING.each {|key, value| tally += value if key.include?(char) }
    end

    tally
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

