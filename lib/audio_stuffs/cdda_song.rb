require 'audio_stuffs/cdda_analysis'
module AudioStuffs
  class CddaSong
    attr_reader :analysis
    def initialize(path, analysis = '0%')
      @path = Pathname(path)
      @analysis = analysis
      @encoding = 'UTF-8'
    end

    def self.from_file(filename, analysis = '0%')
      filetype = File.extname(filename.to_s).match(/\.(.*)/)[1]
      klass = "#{filetype.capitalize}Song"
      AudioStuffs.const_get(klass).new filename, analysis
    rescue NameError
      STDERR.puts "Unable to process #{filename}.  Unknown filetype."
    end

    def name
      @path.basename.to_s.encode @encoding, @encoding, invalid: :replace
    end
    
    def directory
      @path.dirname.to_s.encode @encoding, @encoding, invalid: :replace
    end

    def append_comments!(text)
      open_song_file(@path.to_s) do |file|
        comment = file.tag.comment
        comment = comment.to_s + text.to_s + ' '
        file.tag.comment = comment
        file.save
      end
    end

    def comments
      comments = nil
      open_song_file(@path.to_s) do |file|
        comments = file.tag.comment
      end
      comments
    end

    def open_song_file(filename, &block)
      nil
    end

    def db_id
      AudioStuffs::Song.in_directory(directory)
        .where(name: name)
        .first_or_create 
    end
  end
end
