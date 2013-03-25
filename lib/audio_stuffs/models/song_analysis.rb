require 'audio_stuffs'

module AudioStuffs
  class SongAnalysis < ::ActiveRecord::Base
    self.table_name = 'song_analyses'

    belongs_to :song
  end
end
