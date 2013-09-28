require 'rspec'

def fact(n)
  (1..n).inject(1){|p,i| p*i}
end

def fact2(values)
  values.inject(:+)
end

def fact3(values)
  values.inject('',:+)
end

describe "inject" do
  it "自分自身に対して配列分ブロック処理を行う" do
    fact(4).should eq(24)
  end
  it "expect" do

  end
  it "expect" do
    false
  end
end
