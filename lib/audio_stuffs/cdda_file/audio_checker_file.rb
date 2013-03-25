require 'audio_stuffs/cdda_file'

module AudioStuffs
  class AudioCheckerFile < CddaFile
    def initialize(filename, encoding = 'UTF-8')
      @file = Pathname(filename)
      @text = @file.open {|f| f.each_byte.map {|byte| "" << byte}}.join
      decode(@text)
    end

    FILE_ENCODING = 'UTF-8'

    @@song_analysis_regex = Regexp.new( '-=-\s+([[:graph:]]+)\s+-=-\s+([[:graph:]]+?)\s+(?:\(([[:graph:]]+?)\))?'.encode(FILE_ENCODING) )

    def file_type
      'audiochecker'
    end

    private

    def song_analysis_regex
      @@song_analysis_regex
    end

    def decode(text)
      text.encode!(FILE_ENCODING, FILE_ENCODING, :invalid => :replace)
    end
  end
end
