json.array!(@night_entries) do |night_entry|
  json.extract! night_entry, :id, :weight, :bodyfat, :bmi, :calories_burned
  json.url night_entry_url(night_entry, format: :json)
end
