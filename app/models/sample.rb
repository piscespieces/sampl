class Sample < ApplicationRecord
  belongs_to :sample_pack
  acts_as_taggable_on :tags
  has_one_attached :audio
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user

  def already_liked?(user_id)
    puts self.id
    self.likes.find_by(user_id: user_id).present?
  end

end
