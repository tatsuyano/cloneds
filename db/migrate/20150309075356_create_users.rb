class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :rand_code

      t.timestamps null: false
    end
  end
end
