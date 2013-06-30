#-*- coding:UTF-8 -*-
require 'rspec'

def some_method(a1,a2,a3,a4,a5,a6,a7,a8,a9)
  [a1,a2,a3,a4,a5,a6,a7,a8,a9]
end

def some_method2(a,b)
  [a,b]
end

describe "引数展開" do
  it "配列に*をつけて引数に指定すると展開されて引数になること" do
    array = [3,4,5]
    actual = some_method(1,2,*array,*array,6)
    actual.should eq [1,2,3,4,5,3,4,5,6]
  end
  it "多重代入とは違って明示しないとエラーになります" do
    params = [1,2] # こういう展開はしてくれる
    x,y = params   # これも展開をしてくれる
    lambda{some_method2(params)}.should raise_error(ArgumentError)
  end
  it "これって引数展開を利用してるのかな？" do
    values = ['abc',4,'nani?']
    "%s%d%s" % values
  end
end
