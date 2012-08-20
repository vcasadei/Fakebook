class MensagemsController < ApplicationController
  # GET /mensagems
  # GET /mensagems.json
  def index
    @mensagems = Mensagem.find(:all, :conditions => ["dono = ?", current_user.profile.full_name])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mensagems }
    end
  end

  # GET /mensagems/1
  # GET /mensagems/1.json
  def show
    @mensagem = Mensagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mensagem }
    end
  end

  # GET /mensagems/new
  # GET /mensagems/new.json
  def new
    @mensagem = Mensagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mensagem }
    end
  end

  # GET /mensagems/1/edit
  def edit
    @mensagem = Mensagem.find(params[:id])
  end

  # POST /mensagems
  # POST /mensagems.json
  def create
    @mensagem = Mensagem.new(params[:mensagem])

    respond_to do |format|
      if @mensagem.save
        format.html { redirect_to @mensagem, notice: 'Mensagem was successfully created.' }
        format.json { render json: @mensagem, status: :created, location: @mensagem }
      else
        format.html { render action: "new" }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
    
    @aux = Mensagem.new(dono: @mensagem.dest, remet: @mensagem.remet, dest: @mensagem.dest, mensagem: @mensagem.mensagem)
    @aux.save
  end

  # PUT /mensagems/1
  # PUT /mensagems/1.json
  def update
    @mensagem = Mensagem.find(params[:id])

    respond_to do |format|
      if @mensagem.update_attributes(params[:mensagem])
        format.html { redirect_to @mensagem, notice: 'Mensagem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagems/1
  # DELETE /mensagems/1.json
  def destroy
    @mensagem = Mensagem.find(params[:id])
    @mensagem.destroy

    respond_to do |format|
      format.html { redirect_to mensagems_url }
      format.json { head :no_content }
    end
  end
end
