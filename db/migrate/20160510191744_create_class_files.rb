class CreateClassFiles < ActiveRecord::Migration
  def change
    create_table :class_files do |t|
      t.belongs_to :discipline_class
      t.attachment :attachment
      t.timestamps null: false
    end
  end
end
