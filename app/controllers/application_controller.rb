class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to root_url
end
  
  protect_from_forgery
  
    before_filter :set_locale
 
  def set_locale
    I18n.locale = :ru
  end
 
  private
  
  def extract_locale
    allowed_env = %w{ru} #english, japanese only
    env = (request.env['HTTP_ACCEPT_LANGUAGE'] || "").scan(/^[a-z]{2}/).first
    allowed_env.include?(env) ? env : env = "ru" #default to english
  end
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
end
