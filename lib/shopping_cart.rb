require_relative 'item'
#
# This class represents a shopping cart of items
#
class ShoppingCart

  attr_reader :list

  # Constructor
  def initialize input
    @list = input.inject(Array.new) { |list, itemStr| list << Item.new(itemStr)}
  end

end