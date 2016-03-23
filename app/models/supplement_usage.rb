class SupplementUsage < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplement
  before_create :servings

private
  def servings
    if supplement.servings
      byebug
      self.remaining_servings = supplement.servings
      # finish_date = servings
    end
  end
end
