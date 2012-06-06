require_relative 'item'
#
# This class represents a shopping cart of items
#
# Accepts a string in the format: {qty} {description} at {price}
#
class ShoppingCart

  attr_reader :list

  # Constructor
  def initialize inputStr
    @list = inputStr.inject(Array.new) { |list, itemStr| list << Item.new(itemStr)}
  end

end