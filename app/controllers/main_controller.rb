class MainController < ApplicationController
	def index
		render :index and return
	end

	def login
		render :login and return
	end

	def add_a_word
		render :new_word and return
	end
end
