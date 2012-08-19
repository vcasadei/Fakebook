class CreateParticipacaoEventos < ActiveRecord::Migration
  def change
    create_table :participacao_eventos, :id => false, :force => true do |t|
      t.references :evento, :profile
	  t.timestamps
    end
  end
end
