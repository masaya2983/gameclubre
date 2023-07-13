class Public::GamesController < ApplicationController
   before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
   @game = Game.find(params[:id])
   @category = @game.category
   @comment = Comment.new
   @comments = Comment.all.page(params[:page]).per(4)

   if @game.status_private? && @game.user !=current_user
   respond_to do |format|
    format.html { redirect_to games_path, notice: 'このページにはアクセスできません' }
    end
   end
  end

 def index
    @games = Game.all

  if params[:latest]
      @games = Game.latest.page(params[:page]).per(10)
  elsif params[:old].present?
      @games=Game.old.page(params[:page]).per(10)
  elsif params[:star_count]
     @games = Game.star_count.page(params[:page]).per(10)
  else
      @games = Game.all.page(params[:page]).per(10)
  end
  @game = Game.new
 end


 def create
  @game = Game.new(game_params)
  @game.user_id = current_user.id

  if @game.save
   redirect_to @game
   flash[:notice] ="更新完了"
  else
   @games =Game.all
   render 'new'
  end
 end

 def new
  @game =Game.new
 end

 def edit
   @game = Game.find(params[:id])
    if @game.user == current_user
      render "edit"
    else
        redirect_to games_path
    end
 end


 def update
   @game = Game.find(params[:id])
   if @game.update(game_params)
     redirect_to game_path(@game)
     flash[:notice] ="更新完了"
   else
    @games=Game.all
    render "edit"
   end
 end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

 private
   def set_game
      @game = Game.find(params[:id])
   end

 def game_params
     params.require(:game).permit(:title,:content,:image,:status, :review, :star, :category_id)#,:category_id)
 end
  def ensure_correct_user
    @game = Game.find(params[:id])
    unless @game.user == current_user
      redirect_to games_path
    end
  end
end
