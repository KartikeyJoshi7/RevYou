class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all.order(created_at: :desc)
    @upload = current_user.uploads.build
    @follows = Follow.all
    @rates = Rate.all
    @users = User.all
    @accounts = Account.all
    end
  
  def profile
   @users = User.all
    @name = User.where(username: params[:name])
  end
  def search
    @follows = Follow.all
    @accounts = Account.all
    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end  

  def follow_index
    @uploads = Upload.all
    @follows = Follow.all
    @rates = Rate.all
    @users = User.all
    @accounts = Account.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = current_user.uploads.build
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = current_user.uploads.build(upload_params)
    @follows = Follow.all
    @rates = Rate.all
    @users = User.all
    @accounts = Account.all
    
  
        respond_to do |format|
      if @upload.save

        format.html { redirect_to uploads_url, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
     respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:user_id,:avatar)
    end



end
