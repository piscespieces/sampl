class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  has_one_attached :image
  has_many :sample_packs
  has_many :likes, dependent: :destroy
  has_many :liked_samples, through: :likes, source: :sample

  def artist?
    self.artist
  end
end
