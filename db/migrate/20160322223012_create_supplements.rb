class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string :name
      t.string :brand
      t.references :supplement_category, index: true, foreign_key: true
      t.references :supplement_sub_category, index: true, foreign_key: true
      t.integer :servings

      t.timestamps null: false
    end
  end
end
