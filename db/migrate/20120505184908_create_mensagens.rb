class CreateMensagens < ActiveRecord::Migration
  def self.up
    create_table :mensagens do |t|
      t.integer :destinatario
      t.integer :remetente
      t.string :mensagem
      t.integer :lida
      t.timestamps
    end
  end

  def self.down
    drop_table :mensagens
  end

end
