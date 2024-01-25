=begin
P: write a program to determine a triangle's type
  input: 3 integers
  output: string
  rules : An equilateral triangle has all three sides the same length.
          An isosceles triangle has exactly two sides of the same length.
          A scalene triangle has all sides of different lengths.
          Make sure it's a triangle: all sides must be > 0
                                     sum of any two side must > third side

E: see given test cases

D:
A: - create initialize method
      - put all sides in an array
      - raise error if any side == 0
      - raise error if any 2 sides < 3rd side
        - iterate over array
        - check if array.first > array[1] + array.last
        - check if array[1] > array. first + array.last
        - check if array.last > array.first + array[1]
        - if any are true raise above error

  - create kind method
      - check if all? == array.first
        - return 'equilaterel'
      - check if any 2 are the same
         - call uniq on sides, if count == 2
         - return 'isosceles'
       - check if all are different
         - call uniq on sides, if empty, return 'scalene'
=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

    if @sides.any? { |side| side.sero? } ||
       @sides.first >= @sides[1] + @sides.last ||
       @sides[1] >= @sides.first + @sides.last ||
       @sides.last >= @sides.first + @sides[1]
       raise ArgumentError.new("Invalid lengths for a triangle")
    end
  end

  def kind
    if @sides.all? { |side| side == @sides.first }
      'equilateral'
    elsif @sides.uniq.count == 2
      'isosceles'
    else
      'scalene'
    end
  end
end


#LS Solution
# class Triangle
#   attr_reader :sides

#   def initialize(side1, side2, side3)
#     @sides = [side1, side2, side3]
#     raise ArgumentError.new "Invalid triangle lengths" unless valid?
#   end

#   def kind
#     if sides.uniq.size == 1
#       'equilateral'
#     elsif sides.uniq.size == 2
#       'isosceles'
#     else
#       'scalene'
#     end
#   end

#   private

#   def valid?
#     sides.min > 0 &&
#     sides[0] + sides[1] > sides[2] &&
#     sides[1] + sides[2] > sides[0] &&
#     sides[0] + sides[2] > sides[1]
#   end
# end

# eq = Triangle.new(7,11,9)
# p eq.kind
