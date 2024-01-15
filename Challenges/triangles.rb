=begin
P: determine whether a triangle is equilateral, isosceles, or scalene.
  rules: - each side must be > 0
         - the sum of any 2 sides must be > than the last side
         - equilateral triangle has three sides of equal length
         - isosceles triangle has exactly two sides of the equal length
         - scalene triangle has three sides of unequal length (no two sides have equal length)

---------------- Examples (modeling)



---------------- Data Structures
- a method that accepts three arguments rep. the three sides
  - best to use an array to store the three values
- a method that returns a string representing the type of the triangle

---------------- Algorithm
  constructor method
   - save the three sides
   - Check whether any side length is less than or equal to zero.
      If so, raise an exception.
   - Use comparisons to determine whether the sum of any two side lengths
     is less than or equal to the length of the third side.
     If so, raise an exception.

  'kind' method
    - compare the three sides
    - if all are equal, return 'equilateral'
    - if the triangle is not equilateral, but any two side lengths are equal
      to one another, return 'isosceles'
    - If none of the side lengths are equal to one another, return 'scalene'
=end

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end

eq = Triangle.new(7,11,9)
p eq.kind
