class Public::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "success"
      redirect_to @comment.game
    else
      flash.now[:danger] = "failed"
      render 'public/games/show'
    end
  end

 def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to @comment.game
 end

 private
 def comment_params
   params.require(:comment).permit(:comment, :game_id)
 end
end
