require 'rspec'

def hello
  "world..."
end

class Methods
  def hello
    "world!"
  end
end

describe "Methods" do
  it "Can call use double colon" do
    expect(Methods.new::hello).to eq "world!"
  end
  it "Can call use dot" do
    expect(Methods.new.hello).to eq "world!"
  end
  it "Say hello" do
    expect(hello).to eq "world..."
  end
end
