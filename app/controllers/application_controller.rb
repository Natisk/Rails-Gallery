class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :save_user_link
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    if resource_class == AdminUser
      admin_user_session_path
    else
      Event.create(user_id: current_user.id, related_id: current_user.id, user_action: 'logout')
      categories_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_class == AdminUser
      admin_root_path
    else
      Event.create(user_id: current_user.id, related_id: current_user.id, user_action: 'login')
      categories_path
    end
  end

  def save_user_link
    if user_signed_in?
      VisitedLink.create(user_id: current_user.id, link: request.url)
    end
  end

end
