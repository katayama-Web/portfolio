class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image


  has_many :posts
  has_many :post_comments
  has_many :favorites, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
end