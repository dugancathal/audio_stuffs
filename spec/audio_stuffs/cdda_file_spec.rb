require 'spec_helper'

describe AudioStuffs::CddaFile do
  let(:audiochecker_file) { AudioStuffs::CddaFile.from_file(FIXTURE_PATH.join('audiochecker.log')) }
  let(:aucdtect_file) { AudioStuffs::CddaFile.from_file(FIXTURE_PATH.join('Folder.auCDtect.txt')) }

  let(:audiochecker_regex) { Regexp.new( 'AUDIOCHECKER'.encode('UTF-8') ) }
  let(:aucdtect_regex) { Regexp.new( 'auCDtect'.encode('UTF-16LE') ) }

  it 'delegates to correct type from filename' do
    audiochecker_file.should be_a_kind_of(AudioStuffs::AudioCheckerFile)
    aucdtect_file.should be_a_kind_of(AudioStuffs::AuCdTectFile)
  end

  it 'reads the file and stores it in @file' do
    audiochecker_file.text.should match(audiochecker_regex)
    aucdtect_file.text.should match(aucdtect_regex)
  end

  it 'finds the songs and their CDDA analysis' do
    audiochecker_file.analyses.should be_a_kind_of(Hash)
    aucdtect_file.analyses.should be_a_kind_of(Hash)
  end

  it 'returns CddaSong objects when asked for #songs' do
    audiochecker_file.songs.should be_a_kind_of(Array)
    audiochecker_file.songs.first.should be_a_kind_of(AudioStuffs::CddaSong)
  end

  context 'the audiochecker file' do
    it 'has 11 songs' do
      audiochecker_file.analyses.should have(11).items
    end
  end

  context 'the auCDtect file' do
    it 'has 11 songs' do
      aucdtect_file.analyses.should have(11).items
    end
  end
end
