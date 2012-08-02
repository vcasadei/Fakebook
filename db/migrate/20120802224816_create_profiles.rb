class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.text :about
      t.string :website
      t.string :contact_email
      t.date :birthday
      t.string :gender
      t.string :country
      t.string :state
      t.string :city
      t.string :high_school
      t.string :college
      t.string :work_at
      t.references :user
      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
