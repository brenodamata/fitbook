class AddEntryDateToEntries < ActiveRecord::Migration
  def change
    add_column :day_entries, :entry_date, :date
    add_column :night_entries, :entry_date, :date
  end
end
