class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  
  has_many :collections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :username, presence: true
  
  def already_favorited?(collection)
    #selfにはcurrent_userが入っており、current_userに結びついているいいね（favorites）の中で、↓
    #collection_idが今いいねしようとしているcollection_idが存在するかを調べる
    self.favorites.exists?(collection_id: collection.id)
  end
end
