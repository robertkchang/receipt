#
#
require './receipt'

class Shopping

  ########
  # Main #
  ########

  input_list = Array.new

  begin

    puts 'Enter an item:'
    input = gets.chomp
    input_list << input unless input.to_s.empty?

  end until input.to_s.empty?

  receipt = Receipt.new input_list
  receipt.calculate
  puts '-----------------'
  puts '  Your Receipt   '
  puts '-----------------'
  puts receipt
end
