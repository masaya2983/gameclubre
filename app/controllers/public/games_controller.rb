class Public::GamesController < ApplicationController
  
  def show
   @gane = Game.find(params[:id])
   @comment = Commemt.new
  end
  
  def index
   @games = Game.all
   @game = Game.new
  end
 
 def create
  @game = Game.new(game_params)
  @game.member_id = current_member.id
  if @game.save
  else
  
  end
      
 end
 
 def edit
   
 end
 
 def update
   if @game.update(game_params)
   else
   
   end
 end 
 
 def destroy
  @game.destroy
 end
 
 private
 
 def game_params
     params.require(:game).permit(:tittle, :body)
 end
 
end
