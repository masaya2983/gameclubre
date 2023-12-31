class Game < ApplicationRecord
 belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}

 validates :title,presence:true
  validates :review,presence:true,length:{maximum:200}
  #validates :category,presence:true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
   def self.search_for(content, method)
    if method == 'perfect'
      Game.where(title: content)
    elsif method == 'forward'
      Game.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Game.where('title LIKE ?', '%'+content)
    else
      Game.where('title LIKE ?', '%'+content+'%')
    end
   end
  enum status: { public: 0, private: 1 }, _prefix: true

end
