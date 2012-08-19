class AddCriador < ActiveRecord::Migration
  def up
       add_column :eventos, :criador, :string
  end

  def down
  end
end
