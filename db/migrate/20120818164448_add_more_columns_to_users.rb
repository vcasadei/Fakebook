class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :online, :integer
    add_column :users, :signed_in, :integer
  end
end
