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
end

describe Calc, "#expr" do
  it "returns sum for comma-delimited numbers" do
    calc = Calc.new
    calc.expr(" ,", 3).should eq (0)
    calc.expr(" ,2", 3).should eq (2)
    calc.expr(" ,2,3", 3).should eq (5)
  end
end
