class CreateDisciplineClasses < ActiveRecord::Migration
  def change
    create_table :discipline_classes do |t|
      t.string :name
      t.belongs_to :discipline, index: true
      t.belongs_to :user, index: true
      t.integer :shift

      t.timestamps null: false
    end
  end
end
