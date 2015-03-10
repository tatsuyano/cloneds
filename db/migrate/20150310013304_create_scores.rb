class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user, index: true
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :scores, :users
    add_foreign_key :scores, :tasks
  end
end
