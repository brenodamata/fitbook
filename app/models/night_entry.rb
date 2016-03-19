class NightEntry < ActiveRecord::Base
  def self.entries_this_month
    # DayEntry.where("extract(month from created_at) = ?", Date.today.month) SQL
    NightEntry.where("strftime('%Y%m', created_at) = ?", Date.today.strftime('%Y%m'))
  end

  def self.today(date)
    # DayEntry.where("strftime('%Y%m%d', created_at) = ?", date.strftime('%Y%m%d'))
    NightEntry.where(entry_date: date).first
  end
end
