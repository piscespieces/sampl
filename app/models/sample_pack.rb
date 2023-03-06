class SamplePack < ApplicationRecord
  validates :name, presence: true
  belongs_to :artist
  has_one_attached :image
  has_many :samples, dependent: :destroy
end
