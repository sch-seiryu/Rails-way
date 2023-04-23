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
        # [G2Step18]<Update>~
        # session[:current_user_id] = user.id
        # [G2Step19]<Update>~
        active_session = user.active_sessions.create!(user_agent: request.user_agent, ip_address: request.ip)
        # ~[G2Step19]<Update>
        session[:current_active_session_id] = active_session.id
        # ~[G2Step18]<Update>
    end

    def logout
        # [G2Step18]<Append>~
        active_session = ActiveSession.find_by(id: session[:current_active_session_id])
        # ~[G2Step18]<Append>

        reset_session
        
        # [G2Step18]<Append>~
        active_session.destroy! if active_session.present?
        # ~[G2Step18]<Append>
    end

    def redirect_if_authenticated
        # [G2Step6]<Override>~
        redirect_to api_v1_root_path, alert: "You are already logged in." if user_signed_in?
        # ~[G2Step6]<Override>
    end

    def authenticate_user!
        # [G2Step17]<Append>~
        store_location
        # ~[G2Step17]<Append>
        redirect_to login_path, alert: "You need to login to acces that page." unless user_signed_in?
    end

    private

    def current_user
        # [G2Step18]<Update><Override>~: skipping 'remember_token' part
        # Current.user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
        Current.user = if session[:current_active_session_id].present?
            ActiveSession.find_by(id: session[:current_active_session_id])&.user
        end
        # ~[G2Step18]<Update><Override>
    end

    def user_signed_in?
        Current.user.present?
    end

    # [G2Step17]<Append>~
    def store_location
        session[:user_return_to] = request.original_url if request.get? && request.local?
        # puts "About Session:", session[:user_return_to]
    end
    # ~[G2Step17]<Append>
end
