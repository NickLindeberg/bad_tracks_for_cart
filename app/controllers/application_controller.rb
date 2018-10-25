class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # this lets the view access the helper method
  helper_method :current_user, :current_admin?
  before_action :set_cart


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

end
