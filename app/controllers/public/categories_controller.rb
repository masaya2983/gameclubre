class Public::CategoriesController < ApplicationController
  def search
    @model = params[:model]
		@content = params[:content]
    @games = Game.where(category_id: params[:category])
    render "public/searches/result"
  end
end