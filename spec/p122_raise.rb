# -*- coding:UTF-8 -*-
require 'rspec'

def description
  p "いっぱいクラスがあるからエラーに合った例外オブジェクトを作ってあげるといい"
  p "ないときは自分でつくるよ"
end

class FooError < StandardError; end;

def raise1
  raise ArgumentError, 'message1'
end

def raise2
  error = TypeError.new('message2')
  raise error
end

def raisefoo
  raise FooError
end

describe "Raise" do
  it "raise1はメッセージつきのArgumentErrorが発生すること" do
    lambda{raise1}.should raise_error(ArgumentError, 'message1')
  end
  it "raise2はメッセージつきのArgumentErrorが発生すること" do
    lambda{raise2}.should raise_error(TypeError, 'message2')
  end
  it "raisefooはFooErrorが発生すること" do
    lambda{raisefoo}.should raise_error(FooError)
  end
end
