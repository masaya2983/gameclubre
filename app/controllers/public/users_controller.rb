class Public::UsersController < ApplicationController
 before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @games = @user.games.page(params[:page]).per(10)
    @game = Game.new
    
  end

  def index
  @users =User.all.page(params[:page]).per(10)
  @game = Game.new

  end

  def edit
   @user = User.find(params[:id])

  end

 def update
    @user = User.find(params[:id])
 if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] ="更新完了"
 else
   render "edit"
 end
 end

 def check
   @user = current_user
 end

 def withdrawal
   @user = current_user
    #is_deletedカラムをtrueに変更することにより削除フラグを立てる
  @user.update(is_deleted: true)
  reset_session
  redirect_to root_path
 end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end
 private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

 def is_maching_login_user
   user = User.find(params[:id])
   unless user.id == curent_user.id
     redirect_to user_path(user.id)
   end

 end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
 def ensure_guest_user
   @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user)
       flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
 end

  end
end
