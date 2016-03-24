class SupplementUsage < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplement
  before_create :set_servings

private
  def set_servings
    self.remaining_servings = supplement.servings if supplement.servings
  end
end
