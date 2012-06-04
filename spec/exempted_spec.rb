require "spec_helper"
require "exempted"

describe "Exempted" do
  describe "Initialize" do
    it "should initialize pluralized exempt list" do
      Exempted.list.size.should eql Exempted::EXEMPTED.size * 2
      Exempted::EXEMPTED.each { |itemName|
        Exempted.list.include? itemName + 'S'
      }
    end
  end

  describe "Check Exempt" do
    it "should, given BOOK to be an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Book' is exempted" do
      Exempted::EXEMPTED.include?('BOOK').should eql true
      Exempted.exempt?('book').should eql true
    end

    it "should, given BOOK to be an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Books' is exempted" do
      Exempted::EXEMPTED.include?('BOOK').should eql true
      Exempted.exempt?('books').should eql true
    end

    it "should, given BOOK to be an existing item name in Exempted::EXEMPTED, validate an item with description containing 'BoOK' is exempted" do
      Exempted::EXEMPTED.include?('BOOK').should eql true
      Exempted.exempt?('BoOK').should eql true
    end

    it "should, given PENCIL is NOT an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Pencil' is NOT exempted" do
      Exempted::EXEMPTED.include?('PENCIL').should eql false
      Exempted.exempt?('pencil').should eql false
    end

    it "should, given PENCIL is NOT an existing item name in Exempted::EXEMPTED, validate an item with description containing 'Pencils' is NOT exempted" do
      Exempted::EXEMPTED.include?('PENCIL').should eql false
      Exempted.exempt?('pencils').should eql false
    end
  end
end