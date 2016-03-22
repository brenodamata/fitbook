class CreateSupplementSubCategories < ActiveRecord::Migration
  def change
    create_table :supplement_sub_categories do |t|
      t.string :name
      t.references :supplement_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
