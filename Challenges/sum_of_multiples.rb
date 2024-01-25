=begin
P: given a natural number and a set of numbers, find the sum of all mutliples of
   numbers in set, up to given number
  - if not given set, use 3 and 5 as default

E: - we see there is a class method aside from an instance method, which
    always uses 3 and 5 as set

D: array to store set -> ?array of range 1 thru num -> array for multiples

A: - create Sum class
     - initialize method, takes set(optional, default is 3 & 5)
      ? - save set to array
     - create to method, takes num
       - init multiples array
       - iterate over set array
         - for each char in set, iterate from 1 till num - 1
           - check for numbers that leave no remainder when divided by char
           - save those to multiples array
       - sum multiples array and return
     - create class method, use instance method with 3 & 5 only
=end

class SumOfMultiples
  def initialize(*set)
    @set = (set.empty? == false) ? set : [3, 5]
  end

  def to(num)
    multiples = []
    @set.each do |int|
      1.upto(num -1)do |number|
        multiples << number if number % int == 0
      end
    end
    multiples.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new().to(num)
  end
end

first = SumOfMultiples.new(7, 13, 17)
p first.to(20)

