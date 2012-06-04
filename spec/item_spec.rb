require "spec_helper"
require "item"

describe "Item" do
  it "should parse inputted non-exempt, non-imported item correctly" do
    item = Item.new "1 music CD at 14.99"
    item.exempt?.should eql false
    item.imported?.should eql false
    item.qty.should eql 1
    item.price.should eql 14.99
    item.description.should eql 'music CD'
  end

  it "should parse inputted exempt, non-imported item correctly" do
    item = Item.new "1 packet of headache pills at 9.75"
    item.exempt?.should eql true
    item.imported?.should eql false
    item.qty.should eql 1
    item.price.should eql 9.75
    item.description.should eql 'packet of headache pills'
  end

  it "should parse inputted non-exempt imported item correctly" do
    item = Item.new "1 imported bottle of perfume at 47.50"
    item.exempt?.should eql false
    item.imported?.should eql true
    item.qty.should eql 1
    item.price.should eql 47.50
    item.description.should eql 'imported bottle of perfume'
  end

  it "should parse inputted exempt imported item as non-exempt" do
    item = Item.new "1 imported packet of headache pills at 9.50"
    item.exempt?.should eql true
    item.imported?.should eql true
    item.qty.should eql 1
    item.price.should eql 9.50
    item.description.should eql 'imported packet of headache pills'
  end

  it "should parse inputted item case insensitive" do
    item = Item.new "1 ImPorted packet of headache pIllS At 9.50"
    item.exempt?.should eql true
    item.imported?.should eql true
    item.qty.should eql 1
    item.price.should eql 9.50
    item.description.should eql 'ImPorted packet of headache pIllS'
  end

  it "should error if input is empty" do
    begin
      item = Item.new ""
    rescue
      $!.to_s.should eql 'Input for item is empty. Cannot create item.'
    end
  end

  it "should error if qty is not valid number" do
    begin
      item = Item.new "a imported packet of headache pills at 9.50"
      rescue
        $!.to_s.should eql "Invalid input for item: 'a imported packet of headache pills at 9.50'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if qty is missing" do
    begin
      item = Item.new "imported packet of headache pills at 9.50"
    rescue
      $!.to_s.should eql "Invalid input for item: 'imported packet of headache pills at 9.50'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if qty is 0" do
    begin
      item = Item.new "0 imported packet of headache pills at 9.50"
    rescue
      $!.to_s.should eql "Invalid input for item: '0 imported packet of headache pills at 9.50'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if description is missing" do
    begin
      item = Item.new "1 at 9.50"
    rescue
      $!.to_s.should eql "Invalid input for item: '1 at 9.50'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if description and 'at' are missing" do
    begin
      item = Item.new "1 9.50"
    rescue
      $!.to_s.should eql "Invalid input for item: '1 9.50'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if 'at' is not after description" do
    begin
      item = Item.new "1 book 9.50"
    rescue
      $!.to_s.should eql "Invalid input for item: '1 book 9.50'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if price is missing" do
    begin
      item = Item.new "1 imported packet of headache pills at"
    rescue
      $!.to_s.should eql "Invalid input for item: '1 imported packet of headache pills at'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if price is valid float" do
    begin
      item = Item.new "1 imported packet of headache pills at abc"
    rescue
      $!.to_s.should eql "Invalid input for item: '1 imported packet of headache pills at abc'. Should be: {qty} {description} at {price}"
    end
  end

  it "should error if price is 0" do
    begin
      item = Item.new "1 imported packet of headache pills at 0"
    rescue
      $!.to_s.should eql "Invalid input for item: '1 imported packet of headache pills at 0'. Should be: {qty} {description} at {price}"
    end
  end
end