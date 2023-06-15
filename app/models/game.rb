class Game < ApplicationRecord
  belongs_to :member
  has_many :coments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
   def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
   end
  enum status: { public: 0, private: 1 }, _prefix: true

end
