class Api::V1::ApplicationController < ActionController::Base

    # private
    # def current_user
    #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end
    # helper_method :current_user

    # def authorize
    #     redirect_to :auth, alert: "Not authorized" if current_user.nil?  #
    # end
    # # helper_method :content

    include Authentication
end
