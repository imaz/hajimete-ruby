# -*- encoding: UTF-8 -*-
require 'rspec'

def kumikomi
  p "組み込み関数はKernelモジュールのメソッドです"
  p "すべてのクラスはObjectクラスを通じてKernelモジュールをincludeしています"
end

kumikomi

m = method(:kumikomi)
p m.owner
p m.class
p m.source_location

m = method(:describe)
p m.owner
p m.source_location

describe "what" do
  it "expect" do
    false
  end
end
