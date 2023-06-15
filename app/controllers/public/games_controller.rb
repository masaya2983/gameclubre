class Public::GamesController < ApplicationController

  def show
   @gane = Game.find(params[:id])
   @coment = Comemt.new
   @coments = Coment.all.page(params[:page])
   if @game.status_private? && @game.user !=current_user
   respond_to do |format|
    format.html { redirect_to games_path, notice: 'このページにはアクセスできません' }
    end
   end
  end

  def index
   @games = Game.all.page(params[:page])
   @game = Game.new
  end

 def create
  @game = Game.new(game_params)
  @game.user_id = current_user.id
  if @game.save
    redirect_to @game,nothice: "新規投稿完了."
  else
   @games =Game.all
  render 'index'

  end

 end

 def edit
  @game = Game.find(params[:id])
    if @game.user == current_user
        render "edit"
    else
        redirect_to games_path
    end
  end
 end

 def update
   if @game.update(game_params)
     redirect_to game_path(@game), notice: "更新完了."
   else
    render "edit"
   end
 end

 def destroy
  @game.destro
  redirect_to games_path
 end

 private
   def set_post
      @game = Game.find(params[:id])
   end

 def game_params
     params.require(:game).permit(:tittle,:content,:image,:status, :review, :star)
 end
  def ensure_correct_user
    @game = Game.find(params[:id])
    unless @game.user == current_user
      redirect_to games_path
    end
  end
end
