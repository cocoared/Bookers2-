class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  has_many :favorite, dependent: :destroy
  def favorite_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
