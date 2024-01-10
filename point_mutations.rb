=begin
P: compare two 'strands', in this case strings of equal length at each index, add up them
   up and return the total amount of 'mutations'. If the two lengths are unequal compare up
   till the shorter length
  i: strings
  o: integer
E:
  GAGCCTACTAACGGGAT
  CATCGTAATGACGGCCT
  ^ ^ ^  ^ ^    ^^  There are 7 mutations
D:
  strings > array?

A: We need to determine if one string is shorter, as well as iterate over
   and compare both:

  - constructor method accepts two strings
    - save each to seperate variable

  - a (private)size method which determines which, if any is shorter, saves size to shorter

  - a comparing method that iterates over both, up until the size of the shorter
    - a tally which starts at 0, at each iteration, if the two are different, increase by one
    - return tally when finished
=end

class DNA
  attr_reader :strand_1, :strand_2, :total_length

  def initialize(strand_1, strand_2)
    @strand_1 = strand_1.chars
    @strand_2 = strand_2.chars
    @total_length = size
  end

  def find_hamming
    counter = 0
    tally = 0
    until counter == total_length
      tally += 1 if strand_1[counter] != strand_2[counter]
      counter += 1
    end
    tally
  end

  private
  def size
    strand_1.size < strand_2.size ? strand_1.size : strand_2.size
  end
end

=begin LS Solution (better)

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand : comparison
    differences = 0

    shorter.length.times do |index|
      differences += 1 unless @strand[index] == comparison[index]
    end

    differences
  end
end
=end
