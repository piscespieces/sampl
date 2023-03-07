class Sample < ApplicationRecord
  belongs_to :sample_pack
  validates :name, presence: true
  has_one_attached :audio
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
end
