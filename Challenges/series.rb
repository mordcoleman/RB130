=begin
P: given a string of digits and a number, return all possible number-sized consecutive
  slices in that string
   - throw error if asked for a larger slice than string size
E: - the string "01234" has these 3-digit slices 012, 123, 234 and these 4-digit
     slices 0123, 1234
D:

A: - create Series class
     - initialize method takes string
     - save string
   - create slices method, takes number
     - init array for storage
     - iterate over array of string chars
       - at each iteration, add sub array from current index, number length
     - return storage array
=end
class Series
  def initialize(string)
    @nums = string.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError if num > @nums.size
    array = []
    @nums.each_index do |index|
      array << @nums[index, num] if @nums[index, num].size == num
    end
    array
  end
end
