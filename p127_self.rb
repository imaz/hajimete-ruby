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
  describe "Nested describe" do
    p "Nested describe でコールすると -> " + functionn.to_s
    before:all do
      p "Nested describe の before でコールすると -> " + functionn.to_s
    end
    it "dummy" do
      true
    end
  end

  describe "Nested describe 2" do
    describe "Nested nested describe" do
      p "Nested nested describe でコールすると -> " + functionn.to_s
      before:all do
        p "Nested nested describe の before でコールすると -> " + functionn.to_s
      end
      it "dummy" do
        true
      end
    end
    p "2番目の Nested describe でコールすると -> " + functionn.to_s
    before:all do
      p "2番目の Nested describe の before でコールすると -> " + functionn.to_s
    end
    it "dummy" do
      true
    end
  end

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
