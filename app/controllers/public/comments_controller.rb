class Public::CommentsController < ApplicationController
  
 def create
  game = Game.find(params[:id])
  @comment = current_member.comments.new(game_comment_params)
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
