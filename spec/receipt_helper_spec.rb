require "spec_helper"
require 'item'
require "receipt_helper"

describe "Helper" do
  describe "Round" do
    it "should round correctly if value_to_round is 1.6 and decimal_to_round_to is 0.05" do
      rounded = ReceiptHelper.round_to_nearest 1.6, 0.05
      rounded.should eql 1.60
    end

    it "should round correctly if value_to_round is 1.625 and decimal_to_round_to is 0.05" do
      rounded = ReceiptHelper.round_to_nearest 1.625, 0.05
      rounded.should eql 1.65
    end

    it "should round correctly if value_to_round is 1.63 and decimal_to_round_to is 0.05" do
      rounded = ReceiptHelper.round_to_nearest 1.63, 0.05
      rounded.should eql 1.65
    end

    it "should round correctly if value_to_round is 1.65 and decimal_to_round_to is 0.05" do
      rounded = ReceiptHelper.round_to_nearest 1.65, 0.05
      rounded.should eql 1.65
    end

    it "should round correctly if value_to_round is 1.675 and decimal_to_round_to is 0.05" do
      rounded = ReceiptHelper.round_to_nearest 1.675, 0.05
      rounded.should eql 1.68
    end

    it "should round correctly if value_to_round is 1.68 and decimal_to_round_to is 0.05" do
      rounded = ReceiptHelper.round_to_nearest 1.68, 0.05
      rounded.should eql 1.68
    end

    it "should round correctly if value_to_round is 1.6 and decimal_to_round_to is 0.1" do
      rounded = ReceiptHelper.round_to_nearest 1.6, 0.1
      rounded.should eql 1.6
    end

    it "should round correctly if value_to_round is 1.625 and decimal_to_round_to is 0.1" do
      rounded = ReceiptHelper.round_to_nearest 1.625, 0.1
      rounded.should eql 1.7
    end

    it "should round correctly if value_to_round is 1.63 and decimal_to_round_to is 0.1" do
      rounded = ReceiptHelper.round_to_nearest 1.63, 0.1
      rounded.should eql 1.7
    end

    it "should round correctly if value_to_round is 1.65 and decimal_to_round_to is 0.1" do
      rounded = ReceiptHelper.round_to_nearest 1.65, 0.1
      rounded.should eql 1.7
    end

    it "should round correctly if value_to_round is 1.675 and decimal_to_round_to is 0.1" do
      rounded = ReceiptHelper.round_to_nearest 1.675, 0.1
      rounded.should eql 1.7
    end

    it "should round correctly if value_to_round is 1.68 and decimal_to_round_to is 0.1" do
      rounded = ReceiptHelper.round_to_nearest 1.68, 0.1
      rounded.should eql 1.7
    end
  end

  describe "Exempt" do
    it "should, given BOOK to be an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Book' is exempted" do
      Exempted::EXEMPTED.include?('BOOK').should eql true
      item = Item.new "1 book at 9.99"
      ReceiptHelper.check_exemption(item).should eql true
    end

    it "should, given BOOK to be an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Books' is exempted" do
      Exempted::EXEMPTED.include?('BOOK').should eql true
      item = Item.new "2 books at 9.99"
      ReceiptHelper.check_exemption(item).should eql true
    end

    it "should, given BOOK to be an existing item name in Exempted::EXEMPTED, validate an item with description containing 'BoOK' is exempted" do
      Exempted::EXEMPTED.include?('BOOK').should eql true
      item = Item.new "1 BoOK at 9.99"
      ReceiptHelper.check_exemption(item).should eql true
    end

    it "should, given PENCIL is NOT an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Pencil' is NOT exempted" do
      Exempted::EXEMPTED.include?('PENCIL').should eql false
      item = Item.new "1 pencil at 2.50"
      ReceiptHelper.check_exemption(item).should eql false
    end

    it "should, given PENCIL is NOT an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Pencils' is NOT exempted" do
      Exempted::EXEMPTED.include?('PENCIL').should eql false
      item = Item.new "2 pencils at 2.50"
      ReceiptHelper.check_exemption(item).should eql false
    end
  end
end