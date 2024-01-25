=begin
P: Write a program that converts numbers into roman numerals
  Rules: There is no numeral for zero
         I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000
         To represent 4, 40, or 400 and up, was done by subtraction from a larger
         5, 10, or 100. For example, IV is 1 subtracted from 5, or 4. MCMXC is 1990.
        Ignore 3,000 and up

E: Based on given test cases, we'll need a to_roman method which changes given
   number to correct numeral

D: integer, collections, string
A: We need to figure out how to convert numbers thru 10 to the right numeral,
   particularly those just before 5, 10, which involve the first digit
   subtracting from the following digit

  - create RomanNumeral class
    - create hash of roman numerals, including 4, 9, 40, 90, 400, 900
    - create initialize method that takes integer
      - create new array
      - iterate over number, subtracting the rest of the number at each index from the
        the whole number, save the results to new array
      - iterate over array, at each index, check if included in hash values
         - if so replace(map? or create third array) with numeral
         - if not,

  - create to_roman method

=end

# class RomanNumeral

#   ROMAN_NUMERALS = {
#     "M" => 1000,
#     "CM" => 900,
#     "D" => 500,
#     "CD" => 400,
#     "C" => 100,
#     "XC" => 90,
#     "L" => 50,
#     "XL" => 40,
#     "X" => 10,
#     "IX" => 9,
#     "V" => 5,
#     "IV" => 4,
#     "I" => 1
#   }
#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_version = ''
#     to_convert = number

#     ROMAN_NUMERALS.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version += (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     roman_version
#   end
# end

# class RomanNumeral
#   attr_reader :number

#   def initialize(number)
#     @number = number
#   end

#   def find_roman_num(num)
#     case num
#     when 1..3       then 'I' * num
#     when 4          then 'IV'
#     when 5..8       then 'V' + ('I' * (num - 5))
#     when 9          then 'IX'
#     when 10..30     then 'X' * (num / 10)
#     when 40         then 'XL'
#     when 50..80     then 'L' + ('X' * ((num - 50) / 10))
#     when 90         then 'XC'
#     when 100..300   then 'C' * (num / 100)
#     when 400        then 'CD'
#     when 500..800   then 'D' + ('C' * ((num - 500) / 100))
#     when 900        then 'CM'
#     when 1000..3000 then 'M' * (num / 1000)
#     end
#   end

#   def to_roman
#     digits = number.digits
#     multiplier = 1
#     extended_digits = []

#     digits.each do |digit|
#       extended_digits << digit * multiplier unless digit == 0
#       multiplier *= 10
#     end

#     roman_numerals = extended_digits.reverse.map do |digit|
#       find_roman_num(digit)
#     end

#     roman_numerals.join
#   end
# end
