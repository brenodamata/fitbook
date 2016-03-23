class AddRemainingServingsToSupplementUsage < ActiveRecord::Migration
  def change
    add_column :supplement_usages, :remaining_servings, :integer
  end
end
