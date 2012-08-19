class CreateConversaAtivas < ActiveRecord::Migration
  def self.up
    create_table :conversa_ativas do |t|
      t.integer :destinatario
      t.integer :remetente
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :conversa_ativas
  end

end
