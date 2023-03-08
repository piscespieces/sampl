class Sample < ApplicationRecord
  belongs_to :sample_pack
  has_one_attached :audio
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
  has_many :sample_taggables, dependent: :destroy
  has_many :tags, through: :sample_taggables, source: :sample_tag
end
