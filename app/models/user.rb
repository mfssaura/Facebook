class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :sent_requests, class_name: 'Request', foreign_key: 'user_id', dependent: :destroy
  has_many :received_requests, class_name: 'Request', foreign_key: 'friend_id', dependent: :destroy
  has_many :friends_requested, through: :sent_requests, source: :friend
  has_many :friends_requesting, through: :received_requests, source: :user
  has_many :friendships, dependent: :destroy 
  has_many :friends, through: :friendships
  has_many :comments
  has_many :likes

  validates :name, presence: true, length: { maximum: 50 }

  def feed
    ids = self.friends.pluck(:id) << self.id 
    posts = Post.where(user_id: ids)
    photos = Post.where(user_id: ids)
    combined = ( posts + photos ).sort_by(&:created_at).reverse
    combined
  end 

  def personal_feed
    posts = self.posts
    photos = self.photos
    combined = ( posts + photos).sort_by(&:created_at).reverse
    combined
  end 

  def profile_photo_path
    if profile_photo.nil?
      'fallback/default.jpg'
    else
      profile_photo.file.url(:thumb)
    end 
  end 

end
