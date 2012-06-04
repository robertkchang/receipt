require "spec_helper"
require "custom_float"


describe "Round" do
  it "should round correctly if value_to_round is 0.6" do
    rounded = (0.6).round_to_nearest_point_05
    rounded.should eql 0.6
  end

  it "should round correctly if value_to_round is 0.625" do
    rounded = 0.625.round_to_nearest_point_05
    rounded.should eql 0.65
  end

  it "should round correctly if value_to_round is 0.63" do
    rounded = 0.63.round_to_nearest_point_05
    rounded.should eql 0.65
  end

  it "should round correctly if value_to_round is 0.65" do
    rounded = 0.65.round_to_nearest_point_05
    rounded.should eql 0.65
  end

  it "should round correctly if value_to_round is 0.675" do
    rounded = 0.675.round_to_nearest_point_05
    rounded.should eql 0.7
  end

  it "should round correctly if value_to_round is 0.68" do
    rounded = 0.68.round_to_nearest_point_05
    rounded.should eql 0.7
  end

  it "should round correctly if value_to_round is 0.76" do
    rounded = 0.76.round_to_nearest_point_05
    rounded.should eql 0.8
  end
end