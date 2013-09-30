class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  before_filter do 
    if session[:scholar_id] != nil
      @scholar = Scholar.where(id: session[:scholar_id]).first
    elsif @scholar == nil
      flash[:error] = "Admistrators must log in to see that page."
      #session[:original_route] = request.path_info
      redirect_to "/login" and return
    end
  end

  # GET /admins
  # GET /admins.json
  def index
    @scholars = Scholar.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @scholar = Scholar.find(params[:id])
  end

  # GET /admins/new
  def new
    @scholar = Scholar.new
  end

  # GET /admins/1/edit
  def edit
    @scholar = Scholar.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    new_word = Dinosaurus.new
    
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    @scholar = Scholar.find(params[:id])

    respond_to do |format|
      if @scholar.update(scholar_params)
        format.html { redirect_to edit_admin_path, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scholar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @scholar = Scholar.find(params[:id])

    @scholar.destroy
    respond_to do |format|
      format.html { redirect_to admins_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @scholar = Scholar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholar_params
      params[:scholar].permit(:first_name, :last_name, :username, :email, :student, :is_admin)
    end
end
