require "spec_helper"
require 'item'
require "receipt_helper"

describe "Helper" do
  describe "Round" do
    it "should round correctly if value_to_round is 0.6" do
      rounded = ReceiptHelper.round_to_nearest 0.6
      rounded.should eql 0.6
    end

    it "should round correctly if value_to_round is 0.625" do
      rounded = ReceiptHelper.round_to_nearest 0.625
      rounded.should eql 0.65
    end

    it "should round correctly if value_to_round is 0.63" do
      rounded = ReceiptHelper.round_to_nearest 0.63
      rounded.should eql 0.65
    end

    it "should round correctly if value_to_round is 0.65" do
      rounded = ReceiptHelper.round_to_nearest 0.65
      rounded.should eql 0.65
    end

    it "should round correctly if value_to_round is 0.675" do
      rounded = ReceiptHelper.round_to_nearest 0.675
      rounded.should eql 0.7
    end

    it "should round correctly if value_to_round is 0.68" do
      rounded = ReceiptHelper.round_to_nearest 0.68
      rounded.should eql 0.7
    end

    it "should round correctly if value_to_round is 0.76" do
      rounded = ReceiptHelper.round_to_nearest 0.76
      rounded.should eql 0.8
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