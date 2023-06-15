class Public::CategoriesController < ApplicationController
  def show
   @categories = Category.all
   @category = Category.find(params[:id])
  end
  
  def search
    @word = params[:word]
    @games = Game.where("category LIKE?,""%#{@word}%")
    render "searches/result"
  end
end
