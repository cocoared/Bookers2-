class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  has_many :favorites, dependent: :destroy
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
