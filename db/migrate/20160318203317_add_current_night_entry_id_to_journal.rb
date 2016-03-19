class AddCurrentNightEntryIdToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :current_night_entry_id, :integer
  end
end
