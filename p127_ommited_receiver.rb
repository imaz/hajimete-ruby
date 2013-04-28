# -*- coding:UTF-8 -*-
require 'rspec'

class Baz
  def foo=(a)
    @foo = a
  end
  def foo
    @foo
  end
end

class Foo < Baz
  def myfoo
    foo=1
    self.foo=2
    foo
  end
  def parentfoo
    self.foo=2
    foo=1
    self.foo
  end
end

describe "Foo" do
  it "myfooをコールすると1が得られること" do
    foo = Foo.new
    expect(foo.myfoo).to eq(1)
  end
  it "parentfooをコールすると2が得られること" do
    foo = Foo.new
    expect(foo.parentfoo).to eq(2)
  end
end
