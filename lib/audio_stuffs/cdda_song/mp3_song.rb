require 'audio_stuffs/cdda_song'

module AudioStuffs
  class Mp3Song < CddaSong
    def open_song_file(filename, &block)
      TagLib::MPEG::File.open(filename, &block)
    end
  end
end
