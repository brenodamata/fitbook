class SupplementUsage < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplement
  after_create :servings

private
  def servings
    if supplement.servings
      servings = supplement.servings
      # finish_date = servings
    end
  end
end
