class AddRelationUserJournalEntries < ActiveRecord::Migration
  def change
    add_reference :journals, :user, index: true
    add_reference :day_entries, :journal, index: true
    add_reference :night_entries, :journal, index: true
  end
end
