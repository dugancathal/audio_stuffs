module AudioStuffs
  class CddaSong
    attr_reader :analysis
    def initialize(path, analysis = '0%')
      @path = Pathname(path)
      @analysis = analysis
    end

    def name
      @path.basename.to_s.encode 'UTF-8', 'UTF-8', invalid: :replace
    rescue ArgumentError
      @path.basename.to_s.encode 'UTF-16LE', 'UTF-16LE', invalid: :replace
    end

    def update_comments!(text)
      TagLib::FileRef.open(@path.to_s) do |file|
        file.tag.comments = text
      end
    end

    def comments
      TagLib::FileRef.open(@path.to_s) do |file|
        file.tag.comments = text
      end
    end
  end
end
