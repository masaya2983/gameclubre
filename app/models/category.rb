class Category < ApplicationRecord
  has_many :games, depedent: :destroy
  
  
  enum ccategory:{
    rpg:0,
    action:1,
    shooting:2,
    adventure:3,
    music:4,
    pazule:5,
    sport:6,
    tcg:7,
  }
end
