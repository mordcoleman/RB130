=begin
P: create a clock
  - able to add and subtract minutes, which returns a new Clock object, doesn't
    mutate the other
  - any two clock objects with the same time should be equal to each other

E: -  we should have a constructor that takes 2 nums for hour & minutes
   -  there's a class 'at' method, which can create and return a new instance of Clock, should
    probably use the constructor
     - if no minutes are passed in, default is 00
   - there seems to be a custom to_s method, which returns the time in 00:00 string format
   - there's custom + & - methods, which accept number of minutes
   - custom == method
   - Note that the clock goes back to zero at midnight
   - 24 hour clock

D: numbers --> string

A:  need to find math solution for how to solve wraparound at midnight as well as
     incrementing by 60

    *- create Clock class
      *- define initialize method, takes hr and min
        *- save to hour and min instance variables
      *- define 'at' class method, take 1 or 2 nums, 2nd default is 0
        *- should return new clock by: calling initialize method and pass in nums
      - define + method
        - returns new clock object
        - adds minutes
        - if more than 60, add num.divmod(60), add first then second converted to decimal '.num' (make helper)
        - if total will be more than 24.00, do num.divmod(24), and
      - define - method
        - returns new clock object
        - if more than 60, subtract num.divmod(60), subtract first then,
          if second isn't zero, subtract by another 1. Then add second converted to decimal '.num' (make helper)
      - define == method
        if hour and minute variables have same values, return true
          otherwise false
      - define to_s method
        format the hours and minutes to 00:00
      (- define helper method to compute minutes since midnight
        - Return 60 * hours + minutes, where hours and minutes are from
            the current Clock object.
      - define helper method to compute the time using minutes since midnight)
=end

class Clock
  attr_reader :hour, :minutes

  def initialize(hour, min)
    @hour = hour
    @minutes = min
  end

  def self.at(hour, min = 0)
    new(hour, min)
  end

  def +(other)
    @minutes += other
    if @minutes > 59
      arr = @minutes.divmod(60)
      @minutes = arr[1]
      if @hour + arr[0] >= 24
        arr = (@hour + arr[0]).divmod(24)
        @hour = arr[1]
      else
        @hour += arr[0]
      end
    end
    self.class.at(@hour, @minutes)
  end

  def -(other)
    @minutes -= other
    if @minutes.negative?
      arr = @minutes.divmod(60)
      @minutes = arr[1]
      if @hour.zero?
        arr = (@hour - arr[0]).divmod(24)
        @hour = 24 - arr[1]
      end
      if (@hour + arr[0]) < -24
        arr = arr[0].divmod(-24)
        @hour += arr[1]
      else
        @hour += arr[0]
      end
    end
    self.class.at(@hour, @minutes)
  end

  def ==(other)
    @hour == other.hour && @minutes == other.minutes
  end

  def to_s
    format('%02d:%02d', @hour, @minutes)
  end
end
