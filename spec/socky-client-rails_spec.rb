require 'spec_helper'

describe Socky do
  context "#send" do
    before(:each) do
      described_class.stub!(:send_data)
    end
    context "should normalize options" do
      it "when block given" do
        described_class.should_receive(:send_data).with({:command => :broadcast, :body => "test"})
        described_class.send do |page|
          page << "test"
        end
      end
    end
    context "with block" do
      it "should allow javascript helpers" do
        described_class.should_receive(:send_data).with({:command => :broadcast, :body => "alert(\"test!\");"})
        described_class.send do |page|
          page.alert("test!")
        end
      end
      it "should handle variables from current context" do
        phrase = "test phrase"
        described_class.should_receive(:send_data).with({:command => :broadcast, :body => phrase})
        described_class.send do |page|
          page << phrase
        end
      end
    end
  end
  
  it "#random_host should return host" do
    described_class.random_host.should eql(described_class.hosts.first)
  end

end