require 'spec_helper'

describe AudioStuffs::CddaSong do
  let(:audiochecker_file) { AudioStuffs::CddaFile.from_file(FIXTURE_PATH.join('audiochecker.log')) }
  let(:song_name) { '02_Anywhere_Is.flac' }
  let(:song) { audiochecker_file.songs.select {|song| song.name.match song_name }.first }

  it "knows its name" do
    song.name.should eq(song_name)
  end

  it "knows its CDDA analysis" do
    song.analysis.should eq('100%')
  end

  it "can write comments" do
    song.update_comment!
    song.comment.should match(song.analysis)
  end
end