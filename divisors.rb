# my solution
# def divisors(num)
#   range = (1..num).to_a
#   range.select{|i| num % i == 0 }
# end

#student solution w/ further exploration
def divisors (int)
  results = []
  1.upto(Integer::sqrt(int)) do |n|
    if int % n == 0
      results << n
      results << int / n
    end
  end
  results.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
