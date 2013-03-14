module AudioStuffs
  class CddaDir
    VALID_FILETYPES = %w(audiochecker.log Folder.auCDtect.txt)
    def initialize(path)
      @path = Pathname(path)
    end

    def valid?
      VALID_FILETYPES.map do |file|
        Dir[@path.join('*')].include? @path.join(file).to_s
      end.include? true
    end

    def metadata_files
      VALID_FILETYPES.map {|file| Dir[@path.join(file)].first }
    end
  end
end
