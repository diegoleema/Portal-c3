class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.boolean :is_teacher
      t.string :phone
      t.string :degree
      t.string :lattes
      t.string :link
      t.string :role
      t.text :interests

      t.timestamps null: false
    end
  end
end
