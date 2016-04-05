class CreateNutritionItems < ActiveRecord::Migration
  def change
    create_table :nutrition_items do |t|
      t.string :name
      t.string :unit_of_measure

      t.timestamps null: false
    end
  end
end
