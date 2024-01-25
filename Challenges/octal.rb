=begin
P: given an octal string input, return a decimal output
  rules: invalid input is octal 0
         octal: each digit, right to left, is multiplied by increasing powers of 8,
         starting w/ 0, then summed to give the octal number
         decimal: same, just w/  powers of 10

E: - strings are given
   - if strings include abc's, return is 0
   - n to the power of 0 equals 1
D: string -> array of chars ->

A: - create Octal class
     - save string
   - create to_decimal method
     - validate that there are only numbers, and not 8 or 9, if not return 0
     - init power var to -1
     - iterate over string converted to array of chars reversed with map
       - power += 1
       - at each iteration, return current number muntiplied by 8
         to the power of power var
     - return sum of new array
=end

class Octal
  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 if @string.match(/\D|[8-9]/)
    @string.reverse.chars.map.with_index do |num, index|
      num.to_i * (8**index)
    end.sum
  end
end

