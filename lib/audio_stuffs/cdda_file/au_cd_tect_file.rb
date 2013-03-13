require 'audio_stuffs/cdda_file'

module AudioStuffs
  class AuCdTectFile < CddaFile

    FILE_ENCODING = 'UTF-16LE'

    @@song_analysis_regex = Regexp.new( 'FILE:\s+(\w+).*?CDDA\s+(\d+%)'.encode(FILE_ENCODING), Regexp::MULTILINE )

    private

    def song_analysis_regex
      @@song_analysis_regex
    end

    def decode(text)
      text.encode!('UTF-16LE', 'UTF-16LE', :invalid => :replace)
    end
  end
end
