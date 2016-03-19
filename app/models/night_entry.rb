class NightEntry < ActiveRecord::Base
  def self.entries_this_month
    # DayEntry.where("extract(month from created_at) = ?", Date.today.month) SQL
    NightEntry.where("strftime('%Y%m', created_at) = ?", Date.today.strftime('%Y%m'))
  end

  def self.this_day(date)
    # DayEntry.where("strftime('%Y%m%d', created_at) = ?", date.strftime('%Y%m%d'))
    NightEntry.where(entry_date: date).first
  end

  def self.today
    NightEntry.where(entry_date: Date.today).first
  end
end
