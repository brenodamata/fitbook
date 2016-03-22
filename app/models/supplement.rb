class Supplement < ActiveRecord::Base
  belongs_to :supplement_category
  belongs_to :supplement_sub_category
end
