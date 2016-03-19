json.array!(@day_entries) do |day_entry|
  json.extract! day_entry, :id, :weight, :bodyfat, :bmi, :minutes_of_sleep
  json.url day_entry_url(day_entry, format: :json)
end
