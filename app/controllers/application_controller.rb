class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def after_sign_out_path_for(resource_or_scope)
    if resource_class == AdminUser
      admin_user_session_path
    else
      categories_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_class == AdminUser
      admin_root_path
    else
      categories_path
    end
  end

end
