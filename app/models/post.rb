class Post < ApplicationRecord
  has_one_attached :post_image

  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  enum status: { public: 0, private: 1 }, _prefix: true
end
