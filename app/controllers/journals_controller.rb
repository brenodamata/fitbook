class JournalsController < ApplicationController
  def show
    @day_entries = DayEntry.entries_this_month
    @night_entries = NightEntry.entries_this_month
  end
end
