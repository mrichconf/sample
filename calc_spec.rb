# calc_spec.rb
require './calc.rb'

describe Calc, "#sum" do
  it "returns 0 for non numbers" do
    calc = Calc.new
    calc.sum([""]).should eq(0)
  end
  it "returns sum for 1-3 numbers" do
    calc = Calc.new
    calc.sum(["1"], 3).should eq(1) 
    calc.sum(["1","2"], 3).should eq(3) 
    calc.sum(["1","2","3"], 3).should eq(6) 
    calc.sum(["1","2","3","4"], 3).should eq(6) 
  end
  it "returns sum for an unknown amount of numbers" do
    calc = Calc.new
    calc.sum(["1"]).should eq(1) 
    calc.sum(["1","2"]).should eq(3) 
    calc.sum(["1","2","3"]).should eq(6) 
    calc.sum(["1","2","3","4"]).should eq(10) 
    calc.sum(["1","1","1","2","1","5"]).should eq(11) 
  end
end

describe Calc, "#expr" do
  it "returns sum for 3 comma-delimited numbers" do
    calc = Calc.new
    calc.expr(" ,", 3).should eq (0)
    calc.expr(" ,2", 3).should eq (2)
    calc.expr(" ,2,3", 3).should eq (5)
  end
  it "returns sum for an unknown amount of comma-delimited numbers" do
    calc = Calc.new
    calc.expr(" ,").should eq (0)
    calc.expr(" ,2").should eq (2)
    calc.expr(" ,2,3").should eq (5)
    calc.expr("1, ,2,3,4,2").should eq (12)
  end
end
