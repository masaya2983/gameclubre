class Game < ApplicationRecord
  belongs_to :member
  has_many :coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  enum status: { public: 0, private: 1 }, _prefix: true

end
