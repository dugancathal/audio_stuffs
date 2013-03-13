require 'spec_helper'

describe AudioStuffs::CddaDir do
  let(:dir) { AudioStuffs::CddaDir.new(FIXTURE_PATH) }

  it "is valid if there is at least one of the 'valid' files in it" do
    dir.should be_valid
  end
end
