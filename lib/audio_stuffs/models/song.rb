require 'audio_stuffs'

module AudioStuffs
  class Song < ::ActiveRecord::Base
    self.table_name = 'songs'

    belongs_to :directory
    has_many :song_analyses

    def self.in_directory(dir)
      where(directory_id: Directory.where(name: dir).first_or_create.id)
    end
  end
end
