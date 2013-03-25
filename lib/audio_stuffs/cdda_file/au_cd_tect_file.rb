require 'audio_stuffs/cdda_file'

module AudioStuffs
  class AuCdTectFile < CddaFile
    def initialize(filename, encoding = 'UTF-8')
      @file = Pathname(filename)
      @text = @file.read
      decode(@text)
    end

    FILE_ENCODING = 'UTF-16LE'
    TARGET_ENCODING = 'UTF-8'

    @@song_analysis_regex = Regexp.new( 'FILE:\s+([[:graph:]]+\.[[:graph:]]+).*?Conclusion:\s+([[:graph:]]+)\s+(\d+%)?'.encode(TARGET_ENCODING), Regexp::MULTILINE )

    def file_type
      'auCDtect'
    end

    private

    def song_analysis_regex
      @@song_analysis_regex
    end

    def decode(text)
      text.encode!(TARGET_ENCODING, FILE_ENCODING, :invalid => :replace)
    end
  end
end
