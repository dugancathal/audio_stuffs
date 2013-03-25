module AudioStuffs
  class CddaAnalysis
    attr_reader :song, :type, :percent
    def initialize(song, type, percentage = nil)
      @song = song.encode 'UTF-8'
      @type, @percent = if percentage
        [type.encode('UTF-8'), percentage.encode('UTF-8')]
      else
        ['UNKNOWN', type.encode('UTF-8')]
      end
    end

    def has_error?
      @percent =~ /\?\?\?/ || @percent =~ /error/i
    end
  end
end
