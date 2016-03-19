class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :current_day_entry_id

      t.timestamps null: false
    end
  end
end
