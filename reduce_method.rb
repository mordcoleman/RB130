def reduce(array, default_acc=0)
  if array.first.to_s.to_i == array.first
    sum = default_acc
    counter = 0
  else
    counter = 1
    sum = array[0]
  end

  while counter < array.size
    sum = yield(sum, array[counter])
    counter += 1
  end
  sum
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
