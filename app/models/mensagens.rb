class Mensagens < ActiveRecord::Base
  attr_accessible :destinatario, :remetente, :mensagem, :lida
  
end
