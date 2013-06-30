require 'rspec'

describe "succ" do
  it "数値の場合+1した値が返ってくること" do
    1.succ.should eq 2
  end
  it "負の数値も+1した値が返ってくること" do
    -3.succ.should eq -2
  end
  it "文字列の場合、次の文字が返ってくること" do
    'A'.succ.should eq 'B'
  end
  it "zの次はaa アルファベットは巡っている？" do
    'z'.succ.should eq 'aa'
  end
  it "一番右の値のみsuccされること" do
    '3b4'.succ.should eq '3b5'
  end
  describe "値が繰り上がる時" do
    context "一番右の値が繰り上がる場合" do
      it "繰り上がってひとつ左の値がsuccされること" do
        '3b9'.succ.should eq '3c0'
      end
    end
    context "一番右の値と次の値が繰り上がる場合" do
      it "繰り上がってひとつ左の値がsuccされること" do
        '37z'.succ.should eq '38a'
      end
    end
    context "全部の値が繰り上がる場合" do
      it "4桁になる！" do
        'z9/'.succ.should eq 'aa0/'
        # このケースなんで最後の文字は0にならないんだろう?
        # '/'.succ は '0'
      end
    end
  end
end
