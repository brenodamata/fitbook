class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'paper'
  before_action :authenticate_user!
  before_action :get_journal

  # Uncomnet this method and the before action if there is no journal entry in the DB
  def get_journal
    current_user.get_journal unless current_user.nil?
  end
end
