class Journal < ActiveRecord::Base

  def set_day_entry day_entry_id
    current_day_entry_id = day_entry_id
  end

  # Returns nil if no entry day Today.
  def get_day_entry
    day = current_day_entry_id
    if current_day_entry_id.nil?
      if DayEntry.all.size > 0
        day = DayEntry.last if DayEntry.last.created_at.today?
      end
    else
      last_day = DayEntry.find(current_day_entry_id)
      # is last day today?
      day = last_day if last_day.created_at.today?
    end
    day
  end

  def set_night_entry night_entry_id
    current_night_entry_id = night_entry_id
  end

  # Returns nil if no entry night Today.
  def get_night_entry
    night = current_night_entry_id
    if current_night_entry_id.nil?
      if NightEntry.all.size > 0
        night = NightEntry.last if NightEntry.last.created_at.today?
      end
    else
      last_night = NightEntry.find(current_night_entry_id)
      # is last night today?
      night = last_night if last_night.created_at.today?
    end
    night
  end
end
