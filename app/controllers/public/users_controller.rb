class Public::UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @games = @user.games
  @game = Game.new
  @games= Game.all.page(params[:page])
  end

  def index
  @users =User.all
  @game = Game.new

  end

  def edit
   @user = User.find(params[:id])
    @game = Game.new
  end

 def update
 if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
 else
   render "edit"
 end
 end

 private

def member_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
