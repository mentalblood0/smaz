require "spec"
require "../src/smaz.cr"

describe Smaz do
  ["test", "testtttttttt", "t", ""].each do |input|
    it "can compress/decompress \"#{input}\"" do
      Smaz::Api.decompress(Smaz::Api.compress(input).not_nil!).should eq input
    end
  end
  ["ф", "ффффффф", "1234"].each do |input|
    it "can not compress/decompress \"#{input}\"" do
      Smaz::Api.compress(input).should eq nil
    end
  end
end
