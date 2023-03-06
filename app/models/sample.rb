class Sample < ApplicationRecord
  belongs_to :sample_pack
  validates :name, presence: true
  has_one_attached :audio
end
