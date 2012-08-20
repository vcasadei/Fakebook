class ParticipacaoEventosController < ApplicationController
  # GET /participacao_eventos
  # GET /participacao_eventos.json
  
  before_filter do
  authenticate_user! rescue redirect_to auth_url
end  
  
  def index
    @participacao_eventos = ParticipacaoEvento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participacao_eventos }
    end
  end

  # GET /participacao_eventos/1
  # GET /participacao_eventos/1.json
  def show
    @participacao_evento = ParticipacaoEvento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participacao_evento }
    end
  end

  # GET /participacao_eventos/new
  # GET /participacao_eventos/new.json
  def new
    @evento = Evento.find(params[:evento_id])
    @profile = current_user.profile
	@participacao_evento = @profile.participacao_eventos.build("evento_id" => @evento.id, "profile_id" => @profile.id)
	
	respond_to do |format|
      if @participacao_evento.save
        format.html { redirect_to eventos_url, notice: 'Participationship was successfully created.' }
        format.json { render json: @participacao_evento, status: :created, location: @participacao_evento }
      else
        format.html { render action: "new" }
        format.json { render json: @participacao_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /participacao_eventos/1/edit
  def edit
    @participacao_evento = ParticipacaoEvento.find(params[:id])
  end

  # POST /participacao_eventos
  # POST /participacao_eventos.json
  def create
   @profile = current_user.profile
    @evento = @evento.participacao_eventos.build(params[:participacao_evento])
end
  # PUT /participacao_eventos/1
  # PUT /participacao_eventos/1.json
  def update
    @participacao_evento = ParticipacaoEvento.find(params[:id])

    respond_to do |format|
      if @participacao_evento.update_attributes(params[:participacao_evento])
        format.html { redirect_to @participacao_evento, notice: 'Participacao evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @participacao_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participacao_eventos/1
  # DELETE /participacao_eventos/1.json
  def destroy
    @participacao_evento = ParticipacaoEvento.find(params[:id])
    @participacao_evento.destroy

    respond_to do |format|
      format.html { redirect_to participacao_eventos_url }
      format.json { head :no_content }
    end
  end
end
