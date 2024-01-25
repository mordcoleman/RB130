=begin
P: Write a program that can tell if a number is perfect, abundant, or deficient.
  Perfect: sum of divisors of num is num
  Abundant: sum of divisors of num > num
  Deficient: sum of divisors of num < num

E: - 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6
   - 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9
     which is less than 15.
   - 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36
     which is greater than 24.
   - we see an error is raised if negative

D: integer -> array of nums till integer -> final array -> string

A: - create PerfectNumber class
     - create classify method, takes number
       - raise error if number < 1
       - create array from range of 1 up to given number
       - use select to return anew array of divisors of num (% = 0)
       - sum array, return appropriate string
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError.new("Must be positive") if number < 1
    array = (1...number).to_a
    divisors = array.select{|int| number % int == 0}

    if divisors.sum == number
      'perfect'
    elsif divisors.sum > number
      'abundant'
    else
      'deficient'
    end
  end
end
