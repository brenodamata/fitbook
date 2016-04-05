json.array!(@nutrition_items) do |nutrition_item|
  json.extract! nutrition_item, :id, :name, :unit_of_measure
  json.url nutrition_item_url(nutrition_item, format: :json)
end
