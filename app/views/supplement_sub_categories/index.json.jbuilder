json.array!(@supplement_sub_categories) do |supplement_sub_category|
  json.extract! supplement_sub_category, :id, :name, :supplement_category_id
  json.url supplement_sub_category_url(supplement_sub_category, format: :json)
end
