class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name
      t.string :code
      t.string :link
      t.integer :credit
      t.integer :hours
      t.integer :semester
      t.integer :shift

      t.timestamps null: false
    end
  end
end
