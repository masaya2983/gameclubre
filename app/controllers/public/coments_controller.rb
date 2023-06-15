class Public::ComentsController < ApplicationController
  
 def create
   game = Game.find(params[:game_id])
  @comment = current_user.comments.new(game_comment_params)
  @comment.game_id = game.id
  @comment.save
 end

 def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
 end

 private
 def comement_params
   params.require(:comment).permit(:comment)
 end
end
