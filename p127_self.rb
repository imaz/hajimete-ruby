# -*- encoding: UTF-8 -*-
require 'rspec'

# ベタ書きメソッドのselfはコンテキストに依存するのだ！
Main = self
def mainn
  Main.class
end

def functionn
  self.class
end

class Classs
  def methodd
    self.class
  end
end

p "main直下でコールすると -> " + functionn.to_s

describe "Self class" do
  before:all do
    p "describeメソッドの中でコールすると -> " + functionn.to_s
  end
  it "main is in Object class" do
    expect(mainn.to_s).to eq "Object"
  end
  it "methodd is in Classs class" do
    expect(Classs.new.methodd.to_s).to eq "Classs"
  end
  it "functionn is not in Object class" do
    expect(functionn.to_s).to_not eq "Object"
  end
end
