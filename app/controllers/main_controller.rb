class MainController < ApplicationController

	before_filter except: ["login", "login_post", "root", "logout", "register"] do 
		if session[:scholar_id] != nil
			@scholar = Scholar.where(id: session[:scholar_id])
		elsif @scholar == nil
			flash[:error] = "You must be logged in to see that page."
			#session[:original_route] = request.path_info
			redirect_to "/login" and return
		end
	end
		
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

	def login_post
		@username = params[:username]
		@scholar = Scholar.where(username: @username).first

		if @username = @scholar
			if @scholar.authenticate(params[:password]) != false
				session[:scholar_id] = @scholar.id
				redirect_to "/index"
			else
				flash[:error] = "Incorrect password"
				render :login and return 
			end
		else
			flash[:error] = "Wrong username"
			render :login and return
		end
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

	def logout
		session.clear
		redirect_to "/login"
	end
end