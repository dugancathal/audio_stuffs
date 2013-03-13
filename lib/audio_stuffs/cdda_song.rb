module AudioStuffs
  class CddaSong
    attr_reader :analysis
    def initialize(path, analysis = '0%')
      @path = Pathname(path)
      @analysis = analysis
    end

    def name
      @path.basename.to_s
    end
  end
end
