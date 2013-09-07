class MainController < ApplicationController
	def root
		redirect_to "/index" and return
	end

	def index
		render :index and return
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