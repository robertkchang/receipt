require "spec_helper"
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
end