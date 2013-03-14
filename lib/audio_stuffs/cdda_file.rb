module AudioStuffs
  class CddaFile
    attr_reader :text
    def initialize(filename)
      @file = Pathname(filename)
      @text = @file.read
      decode(@text)
    end

    # Delegates the creation of the File to one of the subclasses
    def self.from_file(filename)
      case Pathname(filename).basename.to_s
      when /audiochecker/ then AudioStuffs::AudioCheckerFile.new(filename)
      when /Folder/ then AudioStuffs::AuCdTectFile.new(filename)
      else raise "Unknown File Type. Got: #{filename.basename}"
      end
    end

    def analyses
      return @analyses if @analyses
      @analyses = {}
      @text.scan(song_analysis_regex).map do |match|
        @analyses[match[0]] = match[1]
      end
      @analyses
    end

    def songs
      @songs ||= analyses.map {|name, analysis| CddaSong.from_file File.join(@file.dirname.to_s, name), analysis.encode('UTF-8') }
    end

    private

    def decode(text)
      text.encode!('UTF-8', 'UTF-8', :invalid => :replace)
    end
  end
end
