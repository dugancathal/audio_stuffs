require 'audio_stuffs/cdda_song'

module AudioStuffs
  class FlacSong < CddaSong
    def open_song_file(filename, &block)
      TagLib::FLAC::File.open(filename, &block)
    end
  end
end
