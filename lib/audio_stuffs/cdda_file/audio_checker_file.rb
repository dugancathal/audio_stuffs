require 'audio_stuffs/cdda_file'

module AudioStuffs
  class AudioCheckerFile < CddaFile

    FILE_ENCODING = 'UTF-8'

    @@song_analysis_regex = Regexp.new( '-=-\s+(.*)\s+-=-.*\((.*)\)'.encode(FILE_ENCODING) )

    private

    def song_analysis_regex
      @@song_analysis_regex
    end

    def decode(text)
      text.encode!('UTF-8', 'UTF-8', :invalid => :replace)
    end
  end
end
