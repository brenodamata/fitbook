class DayEntry < ActiveRecord::Base
  def self.entries_this_month
    # DayEntry.where("extract(month from created_at) = ?", Date.today.month) SQL
    DayEntry.where("strftime('%Y%m', created_at) = ?", Date.today.strftime('%Y%m'))
  end

  def self.this_day(date)
    # DayEntry.where("strftime('%Y%m%d', created_at) = ?", date.strftime('%Y%m%d'))
    DayEntry.where(entry_date: date).first
  end

  def self.today
    DayEntry.where(entry_date: Date.today).first
  end

  def sleep_time
    "#{minutes_of_sleep/60}:#{minutes_of_sleep%60}" if minutes_of_sleep
  end
end
