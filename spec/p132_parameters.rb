require 'rspec'

def some_method(a, b, c = 1)
  [a, b, c]
end

def some_method_center(a, b = 1, c)
  [a, b, c]
end

def some_method_default(a, b = a)
  b
end

def some_method_default_error(a = b, b)
  a
end

def some_method_array(a, b, *c)
  [a, b, c]
end

describe 'arguments' do
  it '省略可能な引数を省略したらデフォルト値が適用される' do
    actual = some_method(2, 3)
    actual.should eq([2, 3, 1])
  end
  it '省略可能な引数は真ん中でも大丈夫' do
    actual = some_method_center(2, 3)
    actual.should eq([2, 1, 3])
  end
  it '引数が渡ってくると default 値は使われない' do
    actual = some_method_center(3, 4, 5)
    actual.should eq([3, 4, 5])
  end
  it 'default 値は遅延評価される' do
    # これがおもしろい!!
    actual = some_method_default(3)
    actual.should eq(3)
  end
  it '後に定義された引数は参照できない' do
    # これもおもしろい!!
    lambda{ some_method_default_error(5) }.should raise_error
  end
  it '*つき引数はそれ以降の引数を配列として受け取る' do
    actual = some_method_array(3, 5, 8)
    actual.should eq([3 ,5 ,[8]])
  end
  it '*つき引数を省略すると空配列になる' do
    actual = some_method_array(3, 5)
    actual.should eq([3 ,5 ,[]])
  end
end
