class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def has_bids?
    @current_item ||= Item.find(params[:item_id]) if params[:item_id]
    
    if @current_item.bids.empty?
      return false
    else
      return true
    end
  end
  helper_method :has_bids?
  
end
