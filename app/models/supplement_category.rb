class SupplementCategory < ActiveRecord::Base
  has_many :supplement_sub_categories
  has_many :supplements
  validates_presence_of :name
  validates_uniqueness_of :name
end
