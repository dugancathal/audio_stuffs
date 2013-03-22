require 'spec_helper'

describe AudioStuffs::CddaFile do
  let(:audiochecker_file) { AudioStuffs::CddaFile.from_file(FIXTURE_PATH.join('comma_in_audiochecker.log')) }

  it "doesn't care about commas in the file name" do
    audiochecker_file.analyses.should have(16).items
  end
end
