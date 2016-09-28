class DisciplineTeacher < ActiveRecord::Migration
  def change
    create_table :disciplines_users, id: false do |t|
      t.belongs_to :discipline, index: true
      t.belongs_to :user, index: true
    end
  end
end
