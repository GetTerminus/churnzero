require "spec_helper"

RSpec.describe Churnzero do
  it "has a version number" do
    expect(Churnzero::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  describe "#configure" do
    before do
      Churnzero.configure do |config|
        config.async = true
        config.app_key = '1234'

      end
    end

    it "initializes a client with options" do
      client = Churnzero::Client.new
      expect(client.instance_variable_get(:@app_key)).to eq '1234'
    end
  end
end
