require 'audio_stuffs'

module AudioStuffs
  class Directory < ::ActiveRecord::Base
    self.table_name = 'directories'

    has_many :songs
  end
end
