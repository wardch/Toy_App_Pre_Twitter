module UserSpecHelpers
  extend ActiveSupport::Concern
  
  def is_logged_in?
    !session[:user_id].nil?
  end
end
