class CreateOportunity < ActiveRecord::Migration
  def change
    create_table :oportunities do |t|
      t.string :title
      t.string :employer
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
