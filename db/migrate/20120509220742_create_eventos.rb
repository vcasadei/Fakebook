class CreateEventos < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
      t.references :profile
      t.string :nome
      t.datetime :data
      t.string :local
      t.text :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :eventos
  end
end
