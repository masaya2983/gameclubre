class Adomin::GamesController < ApplicationController
    before_action :authenticate_admin!, only: [:index,:show,:edit,:update]
  def index
    @game = Game.page(params[:page])
  end
  def show
    @game = Game.find(params[:id])
  end
  def edit
     @game = Game.find(params[:id])
  end
  def update
     game = Game.find(params[:id])
    if game.update(user_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admin_user_path(user.id)
    else
      flash[:notice] = "更新に失敗しました"
      render :edit

    end
  end
end
