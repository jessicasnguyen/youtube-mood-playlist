class Song < ApplicationRecord
    has_many :song_tag, dependent: :destroy
end
