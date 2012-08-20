class CreateMensagems < ActiveRecord::Migration
  def change
    create_table :mensagems do |t|
      t.string  :dono
      t.string   :remet
      t.string   :dest
      t.text :mensagem

      t.timestamps
    end
  end
end
