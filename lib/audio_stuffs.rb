require 'taglib'

require 'audio_stuffs/version'

require 'audio_stuffs/cdda_dir'

require 'audio_stuffs/cdda_analysis'

# Analysis Stuff
require 'audio_stuffs/cdda_file'
require 'audio_stuffs/cdda_file/audio_checker_file'
require 'audio_stuffs/cdda_file/au_cd_tect_file'

# Song Stuff
require 'audio_stuffs/cdda_song'
require 'audio_stuffs/cdda_song/mp3_song'
require 'audio_stuffs/cdda_song/flac_song'

# DB Models
require 'active_record'
require 'audio_stuffs/models/directory'
require 'audio_stuffs/models/song'
require 'audio_stuffs/models/song_analysis'

module AudioStuffs
  def self.env
    @@env ||= ActiveSupport::StringInquirer.new ENV['AUDIO_ENV'] || 'development'
  end

  def self.db_config
    @@db_config ||= YAML::load_file(root.join('config', 'database.yml').to_s)
  end

  def self.root
    @@root ||= Pathname.new(File.expand_path('../../', __FILE__))
  end

  def self.initialize!
    ActiveRecord::Base.establish_connection db_config[env]
  end
end
