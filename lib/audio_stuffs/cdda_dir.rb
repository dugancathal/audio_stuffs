module AudioStuffs
  class CddaDir
    VALID_FILETYPES = %w(audiochecker.log Folder.auCDtect.txt)
    def initialize(path)
      @path = path
    end

    def valid?
      VALID_FILETYPES.map do |file|
        Dir[@path.join('*')].include? @path.join(file).to_s
      end.include? true
    end
  end
end
