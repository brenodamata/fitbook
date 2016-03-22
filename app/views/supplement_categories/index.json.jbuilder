json.array!(@supplement_categories) do |supplement_category|
  json.extract! supplement_category, :id, :name
  json.url supplement_category_url(supplement_category, format: :json)
end
