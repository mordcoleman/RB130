=begin
P: generate the lyrics of 99 bottles, with the appropriate number of bottles
   based on number passed in
E: - must account for 1) the whole song option, 2) 1 bottle option
    3) no more bottles option (0), 4) extra argument to allow for x number of verses
    5) different syntax: bottle, bottles
D:

A: - create BeerSong class
   - create class verse method, takes 1 num
     - set number_of_bottles1 var to num if more than one
       - set "bottles" if number > 1, otherwise "bottle"
       - if 0, "no more..", re-set num to 100
     - set number_of_bottles2 var to check for uppercase "No"
     - set number_of_bottles3 to one less than number_of_bottles1

  - create vers_string var, with appropriate interpolations

  - create class verses method, takes 2 nums
   - iterate from num 1 to num 2, returning verse with each num passed in

  - create class lyrics method, takes verses 99, 0

=end

class BeerSong
  def self.verse(num)
    number_of_bottles1 = nil
      if num == 0
        number_of_bottles1 = "No more bottles"
        num = 100
      elsif num > 1
        number_of_bottles1 = "#{num}" + " bottles"
      else
        number_of_bottles1 = "#{num}" + " bottle"
      end

    number_of_bottles2 = number_of_bottles1.include?("No") ? "no more bottles" : number_of_bottles1

    number_of_bottles3 = nil
      if number_of_bottles1.include?("No")
        number_of_bottles3 = "#{num - 1}" + " bottles"
      elsif number_of_bottles1.match(/\b1\b/)
        number_of_bottles3 = "no more bottles"
      elsif number_of_bottles1.match(/\b2\b/)
        number_of_bottles3 = "#{num - 1}" + " bottle"
      else
        number_of_bottles3 = "#{num - 1}" + " bottles"
      end

    one_or_it = number_of_bottles1.match(/\b1\b/) ? "it" : "one"

    take_or_buy = number_of_bottles1.include?("No") ? "Go to the store and buy some more" : "Take #{one_or_it} down and pass it around"

    verse = "#{number_of_bottles1} of beer on the wall, #{number_of_bottles2} of beer.\n" \
    "#{take_or_buy}, #{number_of_bottles3} of beer on the wall.\n"
  end

  def self.verses(start, finish)
    lines = []
    start.downto(finish){|num| lines << self.verse(num)}
    lines.join("\n")
  end

  def self.lyrics
    self.verses(99, 0)
  end
end

