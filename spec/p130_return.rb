require 'rspec'

def some_method(a)
  return a, 1, 2, 3
end

def some_method_array(a)
  [a, 1, 2, 3]
end

describe 'return' do
  it '多値を返すと配列で受け取れる' do
    actual = *some_method(0) #この呼出のアスタはなんだろう？
    actual.should eq([0, 1, 2, 3])
  end
  it '配列でも返せる' do
    actual = *some_method_array(0)
    actual.should eq([0, 1, 2, 3])
  end
end
