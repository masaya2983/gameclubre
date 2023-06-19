class Public::FavoritesController < ApplicationController

  def create
   game = Game.find(prams[:game_id])
   @favorite = current_member.favorites.new(game_id: game.id)
   @favorite.save
   render 'replace_btn'
  end

  def destroy
   game = Game.find(prams[:game_id])
   @favorite = current_member.favorites.find_by(game_id: game.id)
   @favorite.destroy
    render 'replace_btn'
  end
  #フォロー一覧
  def followings
   user = User.find(params[:user_id])
   @users = user.followings
  end
  #フォロワー一覧
  def followers
   user = User.find(params[:user_id])
   @users = user.followers
  end
end
