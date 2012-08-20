class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
before_filter do
  authenticate_user! rescue redirect_to auth_url
end  
  
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
  	
    	@profile = Profile.find(params[:id])
    if @profile != current_user.profile
  		redirect_to '/'
  		flash[:error] = "You don't have permission"
  	end
  	
  end

  # POST /profiles
  # POST /profiles.json
  #Alterado: para se relacionar com o @user
  #Alterado: após salvar volta pro home#index
  def create
    @user = current_user
    @profile = @user.build_profile(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to root_path, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
	
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  
  def following
    @profile = current_user.profile
    @followeds=@profile.followeds
    render 'following'
  end

  def followers
    @profile = current_user.profile
    @profiles= @profile.followers
    render 'followers'
  end
  
  # GET /profile/1/mural
  # GET /profile/1/mural/1.json
  def mural
  	# @user = User.find(current_user)
  	# TODO: pegar todos os posts de amigos
  	@profile = Profile.find(params[:id])
  	@posts = Array.new
  	@posts.concat(@profile.user.posts)
  	@profile.followeds.each do |friend|
  		@posts.concat(friend.user.posts)
  	end
    @posts.sort! do |a, b| 
    	b.created_at <=> a.created_at
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end
