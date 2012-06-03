require "spec_helper"
require 'receipt'

describe "Receipt" do
  it "should initialize correctly with the given single input" do
    input = Array.new ["1 music CD at 14.99"]
    receipt = Receipt.new input
    receipt.shopping_list.size.should eql 1
    receipt.shopping_list[0].class.should eql Receipt::Item
  end

  it "should initialize correctly with the given multiple inputs" do
    input = Array.new ["1 music CD at 14.99", "1 packet of headache pills at 9.75", "1 imported bottle of perfume at 47.50"]
    receipt = Receipt.new input
    receipt.shopping_list.size.should eql 3
    receipt.shopping_list[0].class.should eql Receipt::Item
    receipt.shopping_list[1].class.should eql Receipt::Item
    receipt.shopping_list[2].class.should eql Receipt::Item
  end

  it "should calculate correctly with the given single input" do
    input = Array.new ["1 music CD at 14.99"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 16.49
    receipt.to_s.should eql "1 music CD: 16.49\r\nSales taxes: 1.50\r\nTotal: 16.49"
  end

  it "should calculate correctly with the given multiple inputs" do
    input = Array.new ["1 music CD at 14.99", "1 packet of headache pills at 9.75", "1 imported bottle of perfume at 47.50"]
    receipt = Receipt.new input
    receipt.calculate
    receipt.receipt_total.should eql 80.89
    receipt.to_s.should eql "1 music CD: 16.49\r\n1 packet of headache pills: 9.75\r\n1 imported bottle of perfume: 54.65\r\nSales taxes: 8.65\r\nTotal: 80.89"
  end

end