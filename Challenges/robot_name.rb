=begin
P: Write a program that generates a random name for a robot. Also
   robot can be wiped, causing it to generate new random name. Most important,
   the same name can never be reused. Name is  string of 2 abcs and 3 numbers.

E: we can see from the exmples that the name has to stick, always the same when
   'name' method called. we also need a method reset which seems to 're-initialize'
   the robot.

D: arrays for numbers and letters, array for storage of previous names

A: - create class variable to store used names
   - crate name method
     - create arrays for abcs and nums
     - loop
       - if robot has a name break
       - otherwise generate random name
       - start over if name is included already in used names variable
     - add name to used names
     - return name
  - create reset method
    - remove name from used name list
    - reassign name to nil
=end
class Robot
  @@used_names = []

  def name
    abc = ("A".."Z").to_a
    nums = ("0".."9").to_a

    loop do
      break if @robot_name
      @robot_name = (abc.sample(2) + nums.sample(3)).join
      @robot_name = nil if @@used_names.include?(@robot_name)
    end
    @@used_names << @robot_name
    @robot_name
  end

  def reset
    @@used_names.delete(@robot_name)
    @robot_name = nil

  end
end

robby = Robot.new

