json.array!(@supplements) do |supplement|
  json.extract! supplement, :id, :name, :brand, :supplement_category_id, :supplement_sub_category_id, :servings
  json.url supplement_url(supplement, format: :json)
end
