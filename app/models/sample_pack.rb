class SamplePack < ApplicationRecord
  validates :name, presence: true
  belongs_to :artist
  has_one_attached :image
  has_many :samples, dependent: :destroy
  accepts_nested_attributes_for :samples, allow_destroy: true
end
