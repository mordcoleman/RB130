=begin
P: Write a program that calculates the 'Hamming' distance between two string, i.e.
   the number of times characters at the same index do not match up.
  rules: if given strings of different length, compute up to the end of the shorter string

E: based on the test cases, it seems there's a DNA class and a 'hamming_distance ',
   the latter returns an integer, or 'the distance'

D: strings, arrays, integer

A: - create DNA class, takes a string as argument
- convert string to arrays of chars
   - create hamming distance method, which takes other string
     - convert each string to arrays of chars
     - set counter to 0
     - determine and assign short and long string to new vars
       - at each index, check if is dif then char at other array index
         - if yes, counter += 1
         - if no, do nothing
       - index plus 1
     - return counter

=end

class DNA
    def initialize(string)
      @string = string
    end

    def hamming_distance(other_string)
      short = nil
      long = nil

      if @string.length > other_string.length
        long = @string
        short = other_string
      else
        long = other_string
        short = @string
      end

      counter = 0
      short.chars.each_with_index{|char, index| counter += 1 if char != long[index]}
      counter
    end
  end

#=begin LS Solution (better)

# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(comparison)
#     shorter = @strand.length < comparison.length ? @strand : comparison
#     differences = 0

#     shorter.length.times do |index|
#       differences += 1 unless @strand[index] == comparison[index]
#     end

#     differences
#   end
# end
#=end

