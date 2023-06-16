class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :games, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #自分がフォローされる（被フォロー）
  has_many :reverse_of_relationships, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  #自分をフォローしている方
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #自分がフォローする方
  has_many :relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  #自分がフォローをしている方
  has_many :followings, through: :relationships, source: :followed

  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'noimage.png'
  end

  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end

    def self.guest
      find_or_create_by(name:'guestmember',email: 'guest@example.com' ) do  |member|
        member.password = SecureRandom.urlsate_base64

      end
    end
    def active_for_authentication?
     super && (is_deleted == false)
    end
end
