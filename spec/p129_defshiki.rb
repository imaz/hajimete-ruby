require 'rspec'

def a(x, y); x * y; end
def b(x, y) x * y; end
def c x, y; x * y; end

def end
  '＼(^o^)／'
end

describe "def式" do
  it "引数カッコありセミコロンあり" do
    a(3,6).should eq(18)
  end
  it "引数カッコありセミコロン省略" do
    b(4,5).should eq(20)
  end
  it "引数カッコ省略セミコロンあり" do
    c(-3,5).should eq(-15)
  end
  it "endメソッドの呼び方" do
    self.send('end').should eq('＼(^o^)／')
  end
end
