require "spec_helper"
require "exempted"

describe "Exempted" do
  it "should initialize pluralized exempt list" do
    Exempted.list.size.should eql Exempted::EXEMPTED.size * 2
    Exempted::EXEMPTED.each { |itemName|
      Exempted.list.include? itemName + 'S'
    }
  end
end