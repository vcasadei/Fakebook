class MensagensController < ApplicationController


  # solicita do BD todos as mensagens para aquele destinatário 

  def history

    @mensagens = Mensagens.where('destinatario = :destinatario AND remetente = :remetente OR destinatario = :remetente AND remetente = :destinatario', {:destinatario => params['destinatario'],:remetente => params['remetente']}).order('id DESC')

    respond_to do |format|
	format.html # history.html
      format.json { render :json => @mensagens }
    end
  end

  # solicita do BD todos as mensagens para aquele destinatário ainda não lidas (lida = 0)
  def atualiza_conversas

    @mensagens = Mensagens.where('destinatario = :destinatario AND lida = 0', {:destinatario => params['id']}).order('remetente, id DESC')

    respond_to do |format|
      format.json { render :json => @mensagens }
    end

    # mensagens foram lidas (lida passa a ser 1)
    @mensagens.each do |cada|
      cada.update_attribute('lida', 1)
    end

  end

  # envia a mensagem para o BD
  def envia_mensagem

    @mensagens = Mensagens.new params['mensagem']
    @mensagens.save

    #if @mensagens.save
    # render :text => 'ok'
    #else
    # render :text => 'nok'
    #end

  end

  # insere no BD que essa janela está aberta (assim se o browser for recarregado a janela será aberta automaticamente)
  def abre_janela

   ConversaAtiva.connection.insert("INSERT INTO conversa_ativas (destinatario, remetente, status, created_at, updated_at) VALUES (#{params['destinatario']},#{params['remetente']}, 1, '2012-08-09', '2012-08-09')")

   #render :text => 'ok'

  end

  # deleta do BD a informação dessa janela aberta
  def fecha_janela

   ConversaAtiva.connection.delete("DELETE FROM conversa_ativas WHERE destinatario = #{params['destinatario']} AND remetente = #{params['remetente']}")

   #render :text => 'ok'

  end

  # todas as janelas abertas desse remetente
  def janelas_abertas

    @ativas = ConversaAtiva.where('remetente = :remetente AND status = 1', {:remetente => params['remetente']}).order('id')

    respond_to do |format|
      format.json { render :json => @ativas }
    end

  end

  # solicita todos os dados do usuário
  def getUser

    @user = User.find(:all, :conditions => ['users.id == ?', params['user']], :joins => :profile, :select => "users.*, profiles.*")

    respond_to do |format|
      format.json { render :json => @user}
    end    

  end

  # verifica quais usuários estão online
  def getOnlineUsers

    @user = User.find(:all, :conditions => ['users.id <> ? AND users.signed_in = 1 AND users.online = 1', current_user.id], :joins => :profile, :select => "users.*, profiles.*")

    respond_to do |format|
      format.json { render :json => @user}
   end

  end

  # set para online e offline
  def set_online

    @user = User.find(params[:id])
    @user.update_attributes(:online => params[:online])
    #if @user.update_attributes(:signed_in => params[:online])
    # render :text => 'ok'
    #else
    # render :text => 'nok'
    #end

  end

  # página inicial de testes
  def teste

    respond_to do |format|
      format.html
    end    

  end

end
