class CreateSupplementCategories < ActiveRecord::Migration
  def change
    create_table :supplement_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
