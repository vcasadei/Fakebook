class ConversaAtiva < ActiveRecord::Base
  attr_accessible :destinatario, :remetente, :status
end
