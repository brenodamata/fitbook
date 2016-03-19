class CreateDayEntries < ActiveRecord::Migration
  def change
    create_table :day_entries do |t|
      t.float :weight
      t.float :bodyfat
      t.float :bmi
      t.integer :minutes_of_sleep

      t.timestamps null: false
    end
  end
end
