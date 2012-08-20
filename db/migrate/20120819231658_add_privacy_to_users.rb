class AddPrivacyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :privacy, :integer
  end
end
