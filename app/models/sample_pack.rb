class SamplePack < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :samples, dependent: :destroy
  accepts_nested_attributes_for :samples, allow_destroy: true, reject_if: :all_blank
end
