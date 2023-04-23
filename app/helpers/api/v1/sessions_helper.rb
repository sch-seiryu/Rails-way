module Api
    module V1
        module SessionsHelper
            include ApplicationHelper

            def login_path
                "/models/current.rb"
            end

            def login_2_path
                "/api/v1/auth/signin"
            end

            def session_path(*_params)
                api_v1_session_path(_params)
            end

            def edit_session_path(*_params)
                edit_api_v1_session_path(_params)
            end
        end
    end
end