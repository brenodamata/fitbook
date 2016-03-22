class JournalsController < ApplicationController
  def show
    @day_entries = DayEntry.entries_this_month
    @night_entries = NightEntry.entries_this_month
    @weight = "Weight: #{DayEntry.last.weight} (#{(DayEntry.last.weight-DayEntry.first.weight).round(2)})"
    @bodyfat = "Bodyfat: #{DayEntry.last.bodyfat}% (#{(DayEntry.last.bodyfat-DayEntry.first.bodyfat).round(2)}%)"
  end
end
