class JournalsController < ApplicationController
  def show
    @day_entries = current_user.this_month_day_entries
    @night_entries = current_user.this_month_night_entries
    @weight = "Weight: #{current_user.current_weight} (#{(current_user.current_weight-current_user.first_weight).round(2)})"
    @bodyfat = "Bodyfat: #{current_user.current_bf}% (#{(current_user.current_bf-current_user.first_bf).round(2)}%)"
  end
end
