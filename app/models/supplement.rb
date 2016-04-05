class Supplement < ActiveRecord::Base
  belongs_to :supplement_category
  belongs_to :supplement_sub_category

  has_many :supplement_usages
  has_many :users, through: :supplement_usages

  has_many :nutrition_infos
  has_many :supplement_items, through: :nutrition_infos

  validates_presence_of :brand
  validates_presence_of :name
  validates_uniqueness_of :name
end
