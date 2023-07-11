class Admin::GamesController < ApplicationController
    before_action :authenticate_admin!
  def index
    @games = Game.order(created_at: :desc).page(params[:page]).per(6)
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def update
     game = Game.find(params[:id])
    if game.update(is_deleted: false)
      flash[:notice] = "更新に成功しました"
      redirect_to admin_game_path(game.id)
   
    end
  end
  
  def destroy
     game = Game.find(params[:id])
    game.update!(is_deleted: true)
    flash[:notice] = "success"
    redirect_to admin_game_path(game)
  end
end
