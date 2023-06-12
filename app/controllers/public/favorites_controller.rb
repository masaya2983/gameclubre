class Public::FavoritesController < ApplicationController
  
   def create
     game = Game.find(prams[:game_id])
     @favorite = current_member.favorites.new(game_id: game.id)
     @favorite.save
   end
  
  def destroy
   game = Game.find(prams[:game_id])
   @favorite = current_member.favorites.find_by(game_id: game.id)
   @favorite.destroy
  end  
end
