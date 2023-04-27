module Api
    module V1
        module SessionsHelper
            # include ApplicationHelper

            # def login_path
            #     "/models/current.rb"
            # end

            # def login_2_path(*_params)
            # def login_form_path(*_params)
            def login_path(*_params)
                # "/api/v1/auth/signin"
                # api_v1_sign_in_path(_params)
                # api_v1_login_path(_params)
                api_v1_login_page_path(_params)
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