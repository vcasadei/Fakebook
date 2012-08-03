class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :profile
      t.boolean :accepted
      t.boolean :blocked
      t.timestamps
    end
    
  end
end
