class DayEntry < ActiveRecord::Base
  def self.entries_this_month
    # DayEntry.where("extract(month from created_at) = ?", Date.today.month) SQL
    DayEntry.where("strftime('%Y%m', created_at) = ?", Date.today.strftime('%Y%m'))
  end

  def self.today(date)
    # DayEntry.where("strftime('%Y%m%d', created_at) = ?", date.strftime('%Y%m%d'))
    DayEntry.where(entry_date: date).first
  end
end
