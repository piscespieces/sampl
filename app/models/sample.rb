class Sample < ApplicationRecord
  belongs_to :sample_pack, inverse_of: :samples
  has_one_attached :audio
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
  has_and_belongs_to_many :sample_tags

  def already_liked?(user_id)
    puts self.id
    self.likes.find_by(user_id: user_id).present?
  end
end
