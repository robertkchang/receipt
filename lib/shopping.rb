require_relative 'receipt'
#
# Interactively accepts one or more item,
#    calculates the sales tax and total,
#       and displays the itemized receipt
#
class Shopping

  ########
  # Main #
  ########

  input_list = []

  begin
    puts 'Enter an item (<ENTER> on empty line to quit):'
    input = gets.chomp
    input_list << input unless input.to_s.empty?
  end until input.to_s.empty?

  begin
    receipt = Receipt.new input_list
    receipt.calculate.print
  rescue
    puts "Error: #{$!}"
  end
end
