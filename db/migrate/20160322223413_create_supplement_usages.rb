class CreateSupplementUsages < ActiveRecord::Migration
  def change
    create_table :supplement_usages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :supplement, index: true, foreign_key: true
      t.date :start_date
      t.date :finsh_date

      t.timestamps null: false
    end
  end
end
