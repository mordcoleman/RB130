#redo!
=begin
P: Given a letter, print a diamond that starts and ends with 'A', and has given
   letter at the widest point, top half ascending to it and bottom half descending
   back down to 'A'. All rows, except for the first and last, should have exactly
   two identical letters.

E: Diamond for letter 'C':
              A
             B B
            C   C
             B B
              A
D:  loops?

A:  probably will need array of abc's, each line is as long as the middle line,
    which seems to be double the length of the letter's index(+ 1), spaces till
    there, then A, then spaces till end. Then newline char. there are always the sam amount
    of spaces, it's just a question of where they go

    - create array of ABCs
    - set space_between to 0
    - set counter to 0
    - set characters(total) to (letter's index + 1) * 2
    -
    - loop till characters
      -
=end
class Diamond
  def self.make_diamond(letter)
    abc = ("A".."Z").to_a
    counter = 0
    current = abc[counter]
    total_chars = ((abc.index(letter) + 1) * 2)
    middle_space = 0
    side_space = ((total_chars - 2) - middle_space) / 2

    loop do
      puts (" " * side_space) + "A" + (" " * side_space) + "\n"
      break if letter == "A"
      loop do
          counter += 1
          side_space -= 1
          middle_space +=2
          puts (" " * side_space) + (abc[counter]) + (" " * middle_space) + (abc[counter]) + (" " * side_space) + "\n"
        break if counter == abc.index(letter)
      end
      loop do
          counter -= 1
          side_space += 1
          middle_space -= 2
          puts (" " * side_space) + (abc[counter]) + (" " * middle_space) + (abc[counter]) + (" " * side_space) + "\n"
        break if counter == 1
      end
      puts (" " * side_space) + " A" + (" " * side_space)
    break
    end
  end
end


puts Diamond.make_diamond("C")
