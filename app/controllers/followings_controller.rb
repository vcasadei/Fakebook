class FollowingsController < ApplicationController
  # GET /followings
  # GET /followings.json
  def index
    @profiles = Profile.all
    #@followings = Following.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @followings }
    end
  end

  # GET /followings/1
  # GET /followings/1.json
  def show
    @following = Following.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @following }
    end
  end

  # GET /followings/new
  # GET /followings/new.json
  def new
    @following = Following.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @following }
    end
  end

  # GET /followings/1/edit
  def edit
    @following = Following.find(params[:id])
  end

  # POST /followings
  # POST /followings.json
  def create
    @profile = current_user.profile
    @following = @profile.followings.build(params[:following])

    respond_to do |format|
      if @following.save
        format.html { redirect_to root_path, notice: 'Following was successfully created.' }
        format.json { render json: @following, status: :created, location: @following }
      else
        format.html { render action: "new" }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /followings/1
  # PUT /followings/1.json
  def update
    @following = Following.find(params[:id])

    respond_to do |format|
      if @following.update_attributes(params[:following])
        format.html { redirect_to @following, notice: 'Following was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followings/1
  # DELETE /followings/1.json
  def destroy
    @following = Following.find(params[:id])
    @following.destroy

    respond_to do |format|
      format.html { redirect_to followings_url }
      format.json { head :no_content }
    end
  end
end
