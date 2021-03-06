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
  it "returns sum for an expression that contains new-lines" do
    calc = Calc.new
    calc.expr(" \n1,2").should eq (3)
    calc.expr("1,2\n3").should eq (6)
  end
  it "returns an exception for invalid delimeters" do
    calc = Calc.new
    expect { calc.expr(" ,\n1,2\n") }.to raise_error(ArgError, 'Invalid delimiter list')
  end
  it "returns sum when an additional delimeter is specified" do
    calc = Calc.new
    calc.expr("\\;\n1;2").should eq (3)
  end
  it "raises exception when a negative number is specified" do
    calc = Calc.new
    expect { calc.expr("1,2,-3,5") }.to raise_error(TermError)
    expect { calc.expr("1,-1,2,-3,5") }.to raise_error(TermError)
  end
end
