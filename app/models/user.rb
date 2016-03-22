class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :journal

  # Gender ISO https://en.wikipedia.org/wiki/ISO/IEC_5218

  def get_journal
    if self.journal.nil?
      journal = Journal.new
      journal.user = self
      journal.save
    end
    return self.journal
  end

  def today_entry
    DayEntry.today self
  end

  def this_month_day_entries
    DayEntry.entries_this_month self
  end

  def this_day_entry date
    DayEntry.this_day(date, self)
  end

  def tonight_entry
    NightEntry.today self
  end

  def this_month_night_entries
    NightEntry.entries_this_month self
  end

  def this_night_entry date
    NightEntry.this_day(date, self)
  end

  def current_weight
    journal.day_entries.order('entry_date DESC').limit(1).first.weight
  end

  def first_weight
    journal.day_entries.order('entry_date').limit(1).first.weight
  end

  def current_bf
    journal.day_entries.order('entry_date DESC').limit(1).first.bodyfat
  end

  def first_bf
    journal.day_entries.order('entry_date').limit(1).first.bodyfat
  end
end
