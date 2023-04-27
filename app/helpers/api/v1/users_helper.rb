module Api
    module V1
        module UsersHelper
            # def users_path(user = nil)
            def users_path(*_params)
                api_v1_users_path(_params)
                # unless user
                #     "/models/user.rb"
                # else
                #     ""
                # end
            end
            
            # TODO 이게 별개로 필요한건가?
            # def user_path(user = nil)
            def user_path(*_params)
                # unless user
                #     "/models/user.rb"
                # else
                #     ""
                # end
                api_v1_user_path(_params)
            end

            def sign_up_path(*_params)
                api_v1_sign_up_page_path(_params)
            end


            # def auth_url(user = nil)
            #     # TODO recommended to log 'user' info for debugging
            #     "/auth/signin"
            # end

            # def sign_in_path(*_params)
            #     api_v1_sign_in_path(_params)
            # end
            # def sign_in_url(*_params)
            #     sign_in_path(_params)
            # end
        end
    end
end
