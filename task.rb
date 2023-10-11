# Бережний Дмитро КС31
def roman_to_arabic(str)
  roman_numerals = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  result = 0
  prev_value = 0

  str.reverse.each_char do |char|
    value = roman_numerals[char]
    unless value
      puts "This character is invalid and cannot be processed: #{char}"
      return
    end

    value < prev_value ? result -= value : result += value
    prev_value = value
  end
  result
end

def arabic_to_roman(started_num)
  roman_numerals = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  unless started_num >= 1 && started_num < 4000
    puts "The number #{started_num} is out of range!"
    return
  end

  result = ""

  roman_numerals.keys.each do |value|
    while started_num >= value
      result += roman_numerals[value]
      started_num -= value
    end
  end

  result
end

# Головний код
unless ARGV.empty?
  if ARGV.length == 1
    str = ARGV[0].to_i
    roman = arabic_to_roman(str)
    puts "Value of #{str} in roman = #{roman}"
    puts "Value of #{roman} in arabic = #{roman_to_arabic(roman)}"
  else
    puts "Not correct value was passed"
  end
  return
end


puts "Since no value is specified in ARGV, here is the default operation of the program."

puts roman_to_arabic("MCMXC") # 1990
puts roman_to_arabic("MMVIII") # 2008
puts roman_to_arabic("MDCLXVI") # 1666
puts roman_to_arabic("XLII") # 42
puts roman_to_arabic("LXIX") # 69
puts roman_to_arabic("CCXXI") # 221
puts roman_to_arabic("DCCCXC") # 890
puts roman_to_arabic("MCMXLIV") # 1944
puts roman_to_arabic("MMMCMXCIV") # 3994
puts roman_to_arabic("MMMdcdcdaaaacCMXCIV") # Not correct!

puts

puts arabic_to_roman(4) # IV
puts arabic_to_roman(1990) # MCMXC
puts arabic_to_roman(2008) # MMVIII
puts arabic_to_roman(1666) # MDCLXVI
puts arabic_to_roman(123) # CXXIII
puts arabic_to_roman(399) # CCCXCIX
puts arabic_to_roman(1776) # MDCCLXXVI
puts arabic_to_roman(3000) # MMM
puts arabic_to_roman(800) # DCCC
puts arabic_to_roman(8000) # Not correct!




