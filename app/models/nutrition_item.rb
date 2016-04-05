class NutritionItem < ActiveRecord::Base
  has_many :nutrition_infos
  has_many :supplements, through: :nutrition_infos

end
