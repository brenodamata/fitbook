class NutritionInfo < ActiveRecord::Base
  belongs_to :supplement
  belongs_to :nutrition_item
end
