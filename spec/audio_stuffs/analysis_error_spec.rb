require 'spec_helper'

describe AudioStuffs::CddaFile do
  context 'Folder.auCDtect.txt' do
    let(:file) { AudioStuffs::CddaFile.from_file(FIXTURE_PATH.join('mpeg_qmark_auCDtect.txt')) }
    it 'can have a one word conclusion that may be "ERROR" or "???"' do
      file.analyses['16_Blue_Modal_Morning_Alive.flac'].should have_error
    end
  end

  context 'audio_checker.log' do
    let(:file) { AudioStuffs::CddaFile.from_file(FIXTURE_PATH.join('comma_in_audiochecker.log')) }
    it 'can have a one word conclusion that may be "ERROR" or "???"' do
      file.analyses['16_Blue_Modal_Morning_Alive.flac'].should have_error
    end
  end
end
