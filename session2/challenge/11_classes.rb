# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class BeerSong
  attr_accessor :bottles

  def initialize(bottles)
    bottles = 0 if bottles < 0
    bottles = 99 if bottles > 99
    @bottles = bottles
  end

  def print_song
    bottles.downto(1) { |x| print_par(x) }
  end

  def print_par(n)
    if n > 0
      puts "#{worded(n)} #{bottle(n)} of beer on the wall,"
      puts "#{worded(n)} #{bottle(n)} of beer,"
      puts "Take one down, pass it around,"
      puts("#{worded(n-1)} #{bottle(n-1)} of beer on the wall.")
    end
  end

  def bottle(n)
    n == 1 ? "bottle" : "bottles"
  end

  def worded(n)
     #first digit:
      first = n / 10
      case first
       when 2 then tens = "Twenty"
       when 3 then tens = "Thirty"
       when 4 then tens = "Forty"
       when 5 then tens = "Fifty"
       when 6 then tens = "Sixty"
       when 7 then tens = "Seventy"
       when 8 then tens = "Eighty"
       when 9 then tens = "Ninety"
       when 0 then tens = ""
      end

     #second digit:
     second = n % 10
     case second
      when 1 then ones = "One"
      when 2 then ones = "Two"
      when 3 then ones = "Three"
      when 4 then ones = "Four"
      when 5 then ones = "Five"
      when 6 then ones = "Six"
      when 7 then ones = "Seven"
      when 8 then ones = "Eight"
      when 9 then ones = "Nine"
     end

     if first == 1
      case second
        when 0 then return "Ten"
        when 1 then return "Eleven"
        when 2 then return "Twelve"
        when 3 then return "Thirteen"
        when 4 then return "Fourteen"
        when 5 then return "Fifteen"
        when 6 then return "Sixteen"
        when 7 then return "Seventeen"
        when 8 then return "Eighteen"
        when 9 then return "Nineteen"
      end
     elsif second == 0 && first == 0
       return "Zero"
     elsif first == 0
        return ones
     elsif second == 0
       return tens
     else
       return "#{tens}-#{ones.downcase}"
     end
  end

end

full = BeerSong.new(99)
full.print_song
