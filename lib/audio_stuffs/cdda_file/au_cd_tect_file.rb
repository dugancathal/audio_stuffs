require 'audio_stuffs/cdda_file'

module AudioStuffs
  class AuCdTectFile < CddaFile

    FILE_ENCODING = 'UTF-16LE'
    TARGET_ENCODING = 'UTF-8'

    @@song_analysis_regex = Regexp.new( 'FILE:\s+(\w+\.\w+).*?CDDA\s+(\d+%)'.encode(TARGET_ENCODING), Regexp::MULTILINE )

    private

    def song_analysis_regex
      @@song_analysis_regex
    end

    def decode(text)
      text.encode!(TARGET_ENCODING, FILE_ENCODING, :invalid => :replace)
    end
  end
end
