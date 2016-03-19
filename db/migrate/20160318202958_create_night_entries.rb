class CreateNightEntries < ActiveRecord::Migration
  def change
    create_table :night_entries do |t|
      t.float :weight
      t.float :bodyfat
      t.float :bmi
      t.integer :calories_burned

      t.timestamps null: false
    end
  end
end
