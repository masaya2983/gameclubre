class Public::UsersController < ApplicationController
  def show
  @member = Member.find(params[:id])
  @games = @user.games
  @game = Game.new
  end
  
  def index
  @user =User.all
  @game = Game.new
  end
  
  def edit
    
  end
  
 def update
 if @user.update(user_params)
   
 else
   
 end
 end
 
 private
  
def member_params
  params.require(:member).permit(:name, :introduction, :profile_image)
end

end
