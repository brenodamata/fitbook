class SupplementSubCategory < ActiveRecord::Base
  belongs_to :supplement_category
  validates_presence_of :name
  validates_presence_of :supplement_category
  validates_uniqueness_of :name
end
