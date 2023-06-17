class Category < ApplicationRecord
  has_many :games, dependent: :destroy

 enum category: { rpg: 0,
                  action: 1,
                  shooting:2,
                  adventure:3,
                  music:4,
                  pazule:5,
                  tcg:6,
                  mix:7,
                  }

end
