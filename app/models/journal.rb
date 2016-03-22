class Journal < ActiveRecord::Base
  belongs_to :user
  has_many :day_entries
  has_many :night_entries

  def set_day_entry day_entry_id
    current_day_entry_id = day_entry_id if DayEntry.find(day_entry_id).entry_date == Date.today
  end

  def set_night_entry night_entry_id
    current_night_entry_id = night_entry_id if NightEntry.find(night_entry_id).entry_date == Date.today
  end

end
