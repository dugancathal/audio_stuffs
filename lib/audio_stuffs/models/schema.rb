require 'audio_stuffs'

module AudioStuffs
  class Schema
    def self.create!
      ::ActiveRecord::Schema.define do
        create_table :song_analyses do |t|
          t.references :song
          t.string :analysis_type, length: 10
          t.string :file_type, length: 20
          t.string :result, length: 10
        end

        add_index :song_analyses, :song_id

        create_table :songs do |t|
          t.references :directory
          t.string :name
        end

        create_table :directories do |t|
          t.string :name
        end
      end
    end
  end
end
