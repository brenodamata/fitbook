class CreateNutritionInfos < ActiveRecord::Migration
  def change
    create_table :nutrition_infos do |t|
      t.references :supplement, index: true, foreign_key: true
      t.references :nutrition_item, index: true, foreign_key: true
      t.float :value

      t.timestamps null: false
    end
  end
end
