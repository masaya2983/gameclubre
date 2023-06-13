class Public::GamesController < ApplicationController
  
  def show
   @gane = Game.find(params[:id])
   @comment = Commemt.new
   @comments = Comment.all.page(params[:page])
  end
  
  def index
   @games = Game.all.page(params[:page])
   @game = Game.new
  end
 
 def create
  @game = Game.new(game_params)
  @game.member_id = current_member.id
  if @game.save
   redirect_to game_path(@game), nothice: "投稿完了."
  else
   @games = Gmame.all
   render 'index'
  end
      
 end
 
 def edit
   
 end
 
 def update
   if @game.update(game_params)
     redirect_to game_path(@game), notice: "投稿完了."
   else
    render "edit"
   end
 end 
 
 def destroy
  @game.destro
  redirect_to game_path
 end
 
 private
 
 def game_params
     params.require(:game).permit(:tittle, :body)
 end
  def ensure_correct_user
    @game = Game.find(params[:id])
    unless @game.user == current_user
      redirect_to games_path
    end
  end
end
