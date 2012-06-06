require "spec_helper"
require 'shopping_cart'
require 'item'

describe "ShoppingCart" do
  it "should initialize correctly with the given single input" do
    input = Array.new ["1 music CD at 14.99"]
    cart = ShoppingCart.new input
    cart.list.size.should eql 1
    cart.list[0].class.should eql Item
  end

  it "should initialize correctly with the given multiple inputs" do
    input = Array.new ["1 music CD at 14.99", "1 packet of headache pills at 9.75", "1 imported bottle of perfume at 47.50"]
    cart = ShoppingCart.new input
    cart.list.size.should eql 3
    cart.list[0].class.should eql Item
    cart.list[1].class.should eql Item
    cart.list[2].class.should eql Item
  end
end