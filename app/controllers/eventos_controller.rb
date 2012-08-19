class EventosController < ApplicationController
  def index
    @search = Search.new(:evento, params[:search])

	@eventos = current_user.profile.eventos
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end

  def pesquisa
    @search = Search.new(:evento, params[:search])
    @eventos = @search.run(:order => 'data')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end
  
  def show2
    @evento = Evento.find(params[:id])
  end
  
  def participar
   
  end
 
  
  def show
    @evento = Evento.find(params[:id])
  end

  def new
    @evento = Evento.new
  end

  def create
#    @evento = Evento.new(params[:evento])
    @profile = current_user.profile
    @evento = @profile.eventos.build(params[:evento])

    if @evento.save
      redirect_to @evento, :notice => "Evento criado com sucesso."
    else
      render :action => 'new'
    end
  end

  def edit
    @evento = Evento.find(params[:id])
  end

  def update
    @evento = Evento.find(params[:id])
    if @evento.update_attributes(params[:evento])
      redirect_to @evento, :notice  => "Evento atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy
    redirect_to eventos_url, :notice => "Evento excluido com sucesso."
  end
end
