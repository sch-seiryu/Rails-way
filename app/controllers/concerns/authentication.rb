module Authentication
    # TODO (confirm that) Is it necessary to append versioning here?
    extend ActiveSupport::Concern

    included do
        before_action :current_user
        helper_method :current_user
        helper_method :user_signed_in?
    end

    def login(user)
        reset_session
        session[:current_user_id] = user.id
    end

    def logout
        reset_session
    end

    def redirect_if_authenticated
        redirect_to root, alert: "You are already logged in." if user_signed_in?
    end

    private

    def current_user
        Current.user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
    end

    def user_signed_in?
        Current.user.present?
    end

    def authenticate_user!
        # [G2Step17]<Append>~
        store_location
        # ~[G2Step17]<Append>
        redirect_to login_path, alert: "You need to login to acces that page." unless user_signed_in?
    end

    # [G2Step17]<Append>~
    privte

    def store_location
        session[:user_return_to] = request.original_url if request.get? && request.local?
    end
    # ~[G2Step17]<Append>
end