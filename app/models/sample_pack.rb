class SamplePack < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :samples, dependent: :destroy, inverse_of: :sample_pack
  accepts_nested_attributes_for :samples, allow_destroy: true, reject_if: :all_blank
  has_and_belongs_to_many :genres

  private 

  def validate_genre_list
    errors.add(:genres, "sample pack cannot have more than 3 genres") if genres.size > 3
  end
end
