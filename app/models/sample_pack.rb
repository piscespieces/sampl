class SamplePack < ApplicationRecord
  belongs_to :artist
  has_one_attached :file
end
