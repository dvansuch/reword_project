 class MainController < ApplicationController

	before_filter except: ["login", "login_post", "root", "logout", "register", "about", "register_post"] do 
		if session[:scholar_id] != nil
			@scholar = Scholar.where(id: session[:scholar_id])
		elsif @scholar == nil
			flash[:error] = "You must be logged in to see that page."
			#session[:original_route] = request.path_info
			redirect_to "/login" and return
		end
	end
		
	def root
		render :main
	end

	def about
		render :about
	end

	def index
		@results = Dinosaurus.lookup(@input)
		render :index
	end

	def index_post
		if params[:commit] == "ReWord"
			@input = params["word"]
			@results = Dinosaurus.lookup(@input)

			render :index
		elsif params[:commit] == "Try Again"
			
			render :index
		end
	end

	def login
		render :scholar_login
	end

	def login_post
		@username = params[:username]
		@scholar = Scholar.where(username: @username).first

		if @username = @scholar
			if @scholar.authenticate(params[:password]) != false
				session[:scholar_id] = @scholar.id
				if 
					@scholar.is_admin == false
					redirect_to "/index"
				else
					redirect_to "/admin_controller"
				end
			else
				flash[:error] = "Incorrect password"
				render :scholar_login 
			end
		else
			flash[:error] = "Wrong username"
			render :scholar_login
		end
	end

	def register
		render :register
	end

	def register_post
		if params[:commit] == "Sign Up"
			scholar = Scholar.new
			scholar.first_name = params["first_name"]
			scholar.last_name = params["last_name"]
			scholar.username = params[:username]
			scholar.password = params[:password]
			scholar.password_confirmation = params[:password_confirmation]
			scholar.email = params["email"]
			if params[:student] == nil
				scholar.student = false
			else
				scholar.student = true
			end

			if params[:is_admin] == nil
				scholar.is_admin = false
			else
				scholar.is_admin = true
			end

			scholar.save!

			if scholar.save == true
				flash[:notice] = "Thank you for registering, please log in to start using ReWord"
				redirect_to "/login"
			else
				flash[:error] = "Registration Failed"
				render :register and return
			end
		end
	end

	def add_a_word
		render :new_word
	end

	def admin_controller
		render :admin_control
	end

	def logout
		session.clear
		redirect_to "/login"
	end
end