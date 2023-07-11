class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		 
		  @game = Game.new
	
			@games = Game.search_for(@content, @method).page(params[:page]).per(4)

	end
end
