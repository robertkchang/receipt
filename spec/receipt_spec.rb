require "spec_helper"
require 'receipt'
require 'item'

describe "Receipt" do
  it "should initialize correctly with the given single input" do
    input = Array.new ["1 music CD at 14.99"]
    receipt = Receipt.new input
    receipt.shopping_list.size.should eql 1
    receipt.shopping_list[0].class.should eql Item
  end

  it "should initialize correctly with the given multiple inputs" do
    input = Array.new ["1 music CD at 14.99", "1 packet of headache pills at 9.75", "1 imported bottle of perfume at 47.50"]
    receipt = Receipt.new input
    receipt.shopping_list.size.should eql 3
    receipt.shopping_list[0].class.should eql Item
    receipt.shopping_list[1].class.should eql Item
    receipt.shopping_list[2].class.should eql Item
  end

  it "should calculate correctly with the given single input" do
    input = Array.new ["1 music CD at 14.99"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 16.49
    receipt.to_s.should eql "===  Your Receipt  ===#{$CR_LF}1 music CD: 16.49#{$CR_LF}Sales taxes: 1.50#{$CR_LF}Total: 16.49"
  end

  it "should calculate correctly with the given multiple inputs" do
    input = Array.new ["1 music CD at 14.99", "1 packet of headache pills at 9.75", "1 imported bottle of perfume at 47.50"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 80.89
    receipt.to_s.should eql "===  Your Receipt  ===#{$CR_LF}1 music CD: 16.49#{$CR_LF}1 packet of headache pills: 9.75#{$CR_LF}1 imported bottle of perfume: 54.65#{$CR_LF}Sales taxes: 8.65#{$CR_LF}Total: 80.89"
  end

  it "should calculate correctly with the given use case" do
    input = Array.new ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 29.83
    receipt.to_s.should eql "===  Your Receipt  ===#{$CR_LF}1 book: 12.49#{$CR_LF}1 music CD: 16.49#{$CR_LF}1 chocolate bar: 0.85#{$CR_LF}Sales taxes: 1.50#{$CR_LF}Total: 29.83"
  end

  it "should calculate correctly with the given second use case" do
    input = Array.new ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 65.15
    receipt.to_s.should eql "===  Your Receipt  ===#{$CR_LF}1 imported box of chocolates: 10.50#{$CR_LF}1 imported bottle of perfume: 54.65#{$CR_LF}Sales taxes: 7.65#{$CR_LF}Total: 65.15"
  end

  it "should calculate correctly with the given third use case" do
    input = Array.new ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 74.68
    receipt.to_s.should eql "===  Your Receipt  ===#{$CR_LF}1 imported bottle of perfume: 32.19#{$CR_LF}1 bottle of perfume: 20.89#{$CR_LF}1 packet of headache pills: 9.75#{$CR_LF}1 box of imported chocolates: 11.85#{$CR_LF}Sales taxes: 6.70#{$CR_LF}Total: 74.68"
  end

  it "should calculate correctly with the given fourth use case" do
    input = Array.new ["1 can of soup at 0.85", "1 bowl of cereal at 10.45", "10 cases of nuts at 1.50", "20 imported bottles of shampoo at 2.50"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 86.50
    receipt.to_s.should eql "===  Your Receipt  ===#{$CR_LF}1 can of soup: 0.95#{$CR_LF}1 bowl of cereal: 11.50#{$CR_LF}10 cases of nuts: 16.50#{$CR_LF}20 imported bottles of shampoo: 57.55#{$CR_LF}Sales taxes: 10.20#{$CR_LF}Total: 86.50"
  end

  it "should calculate correctly with the given fifth use case" do
    input = Array.new ["10 chocolate bar at 0.85"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 8.50
    receipt.to_s.should eql "===  Your Receipt  ===#{$CR_LF}10 chocolate bar: 8.50#{$CR_LF}Sales taxes: 0.00#{$CR_LF}Total: 8.50"
  end

end