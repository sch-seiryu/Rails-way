module Api
    module V1
        module ActiveSessionsHelper
            def active_session_path(*_params)
                api_v1_active_session_path(_params)
            end

            def destroy_all_active_sessions_path(*_params)
                destroy_all_api_v1_active_sessions_path(_params)
            end
        end
    end
end