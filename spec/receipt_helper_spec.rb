require "spec_helper"
require "receipt_helper"

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