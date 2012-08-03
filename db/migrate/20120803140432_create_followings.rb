class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.boolean :accepted
      t.boolean :blocked

      t.timestamps
    end
  end
end
