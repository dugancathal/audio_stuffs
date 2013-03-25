module AudioStuffs
  class CddaFile
    attr_reader :text
    def initialize(filename, encoding = 'UTF-8')
      raise "File reading must be implemented in a subclass"
    end

    # Delegates the creation of the File to one of the subclasses
    def self.from_file(filename)
      case Pathname(filename).basename.to_s
      when /audiochecker/i then AudioStuffs::AudioCheckerFile.new(filename, 'UTF-8')
      when /auCDtect/i then AudioStuffs::AuCdTectFile.new(filename, 'UTF-16LE')
      else raise "Unknown File Type. Got: #{filename.basename}"
      end
    end

    def analyses
      return @analyses if @analyses
      @analyses = {}
      @text.scan(song_analysis_regex).map do |match|
        @analyses[match[0]] = CddaAnalysis.new match[0], match[1], match[2]
      end
      @analyses
    end

    def songs
      @songs ||= analyses.map {|name, analysis| CddaSong.from_file File.join(@file.dirname.to_s, name), analysis }
    end

    private

    def decode(text)
      text.encode!('UTF-8', 'UTF-8', :invalid => :replace)
    end
  end
end
