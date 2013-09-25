class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @scholars = Scholar.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
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
    @scholar = Scholar.new(scholar_params)

    respond_to do |format|
      if @scholar.save
        format.html { redirect_to @scholar, notice: 'Admin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scholar }
      else
        format.html { render action: 'new' }
        format.json { render json: @scholar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
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
    @scholar.destroy
    respond_to do |format|
      format.html { redirect_to }
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
