=begin
P: write a program to determine a triangle's type
  input: 3 integers
  output: string
  rules : An equilateral triangle has all three sides the same length.
          An isosceles triangle has exactly two sides of the same length.
          A scalene triangle has all sides of different lengths.
          Make sure it's a triangle: all sides must be > 0
                                     sum of any two side must > third side

                                     
=end




class Triangle
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def what_type

  end
end


