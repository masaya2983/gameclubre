class Public::GamesController < ApplicationController

  def show
   @game = Game.find(params[:id])
   @category = @game.category
   @comment = Comment.new
   @comments = Comment.all.page(params[:page])
   if @game.status_private? && @game.user !=current_user
   respond_to do |format|
    format.html { redirect_to games_path, notice: 'このページにはアクセスできません' }
    end
   end
  end

  def index
    if params[:latest]
      @games = Game.latest.page(params[:page])
    elsif params[:old].present?
      @games=Game.old.page(params[:page])
    else
      @games = Game.all
    end
    @game = Game.new
  end

 def create
  @game = Game.new(game_params)
  @game.user_id = current_user.id
  if @game.save!
   redirect_to @game,nothice: "新規投稿完了."
  else
   @games =Game.all
   render 'index'
  end
end


 def edit
  @game = Game.find(params[:id])
 end


 def update
   @game = Game.find(params[:id])
   if @game.update(game_params)
     redirect_to game_path(@game), notice: "更新完了."
   else
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
