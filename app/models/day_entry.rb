class DayEntry < ActiveRecord::Base
  belongs_to :journal
  validates :journal_id, presence: true

  def self.entries_this_month user
    # DayEntry.where("extract(month from created_at) = ?", Date.today.month) SQL
    user.journal.day_entries.where("strftime('%Y%m', created_at) = ?", Date.today.strftime('%Y%m'))
  end

  def self.this_day(date, user)
    # DayEntry.where("strftime('%Y%m%d', created_at) = ?", date.strftime('%Y%m%d'))
    user.journal.day_entries.where(entry_date: date).first
  end

  def self.today user
    user.journal.day_entries.where(entry_date: Date.today).first
  end

  def sleep_time
    "#{minutes_of_sleep/60}:#{minutes_of_sleep%60}" if minutes_of_sleep
  end
end
