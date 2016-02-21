module Admin
  class ApplicationController < ActionController::Base
    include Godmin::ApplicationController
    include Godmin::Authentication

    def admin_user_class
      AdminUser
    end

    def authenticate_admin_user
      authenticate_user!
    end

    def admin_user
      current_user
    end

    def admin_user_signed_in?
      user_signed_in?
    end

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
  end
end