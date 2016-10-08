class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :attachment
      t.belongs_to :discipline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
