class MainController < ApplicationController
	def root
		render :main and return
	end

	def index
		render :index and return
	end

	def index_post
		if params[:commit] == "ReWord"
			@input = params["input"]
			
			render :index and return
		elsif params[:commit] == "Try Again"
			render :index and return
		end
	end

	def login
		render :login and return
	end

	def register
			render :register and return
		end

	def test
		render :test and return
	end

	def add_a_word
		render :new_word and return
	end
end